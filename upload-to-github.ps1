# Скрипт для загрузки файлов на GitHub
Write-Host "=== Загрузка файлов на GitHub ===" -ForegroundColor Cyan
Write-Host ""

# Проверяем, инициализирован ли git
if (-not (Test-Path .git)) {
    Write-Host "Инициализация git репозитория..." -ForegroundColor Yellow
    git init
    git branch -M main
}

Write-Host "Добавление всех файлов..." -ForegroundColor Yellow
git add .

Write-Host ""
$commitMessage = Read-Host "Введите сообщение коммита (или нажмите Enter для 'Initial commit')"
if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    $commitMessage = "Initial commit"
}

Write-Host "Создание коммита..." -ForegroundColor Yellow
git commit -m $commitMessage

Write-Host ""
Write-Host "Теперь нужно добавить удаленный репозиторий:" -ForegroundColor Cyan
Write-Host "1. Создайте репозиторий на GitHub (например, github.com/ваш_username/space)" -ForegroundColor White
Write-Host "2. Скопируйте URL репозитория (например: https://github.com/ваш_username/space.git)" -ForegroundColor White
Write-Host ""
$repoUrl = Read-Host "Вставьте URL вашего репозитория на GitHub"

if (-not [string]::IsNullOrWhiteSpace($repoUrl)) {
    Write-Host "Добавление удаленного репозитория..." -ForegroundColor Yellow
    git remote add origin $repoUrl 2>$null
    if ($LASTEXITCODE -ne 0) {
        git remote set-url origin $repoUrl
    }
    
    Write-Host "Отправка файлов на GitHub..." -ForegroundColor Yellow
    git push -u origin main
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "✅ Файлы успешно загружены на GitHub!" -ForegroundColor Green
    } else {
        Write-Host ""
        Write-Host "❌ Ошибка при отправке. Проверьте URL репозитория и права доступа." -ForegroundColor Red
    }
} else {
    Write-Host ""
    Write-Host "Вы можете добавить репозиторий позже командой:" -ForegroundColor Yellow
    Write-Host "git remote add origin ВАШ_URL" -ForegroundColor White
    Write-Host "git push -u origin main" -ForegroundColor White
}

