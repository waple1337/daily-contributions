@echo off
chcp 65001 >nul
echo === Загрузка файлов на GitHub ===
echo.

if not exist .git (
    echo Инициализация git репозитория...
    git init
    git branch -M main
)

echo Добавление всех файлов...
git add .

echo.
set /p commitMessage="Введите сообщение коммита (или нажмите Enter для 'Initial commit'): "
if "%commitMessage%"=="" set commitMessage=Initial commit

echo Создание коммита...
git commit -m "%commitMessage%"

echo.
echo Теперь нужно добавить удаленный репозиторий:
echo 1. Создайте репозиторий на GitHub (например, github.com/ваш_username/space)
echo 2. Скопируйте URL репозитория (например: https://github.com/ваш_username/space.git)
echo.
set /p repoUrl="Вставьте URL вашего репозитория на GitHub: "

if not "%repoUrl%"=="" (
    echo Добавление удаленного репозитория...
    git remote add origin %repoUrl% 2>nul
    if errorlevel 1 git remote set-url origin %repoUrl%
    
    echo Отправка файлов на GitHub...
    git push -u origin main
    
    if errorlevel 1 (
        echo.
        echo ❌ Ошибка при отправке. Проверьте URL репозитория и права доступа.
    ) else (
        echo.
        echo ✅ Файлы успешно загружены на GitHub!
    )
) else (
    echo.
    echo Вы можете добавить репозиторий позже командой:
    echo git remote add origin ВАШ_URL
    echo git push -u origin main
)

pause

