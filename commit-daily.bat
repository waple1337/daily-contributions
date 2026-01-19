@echo off
chcp 65001 >nul
echo Генерация ежедневных данных...
python generate_daily.py

echo.
echo Добавление изменений в git...
git add daily-log.json

echo.
echo Создание коммита...
git commit -m "Daily update: %date%"

echo.
echo Отправка на GitHub...
git push

echo.
echo ✅ Готово! Коммит отправлен.

