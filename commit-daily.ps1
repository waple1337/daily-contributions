# PowerShell скрипт для ежедневного коммита
Write-Host "Генерация ежедневных данных..." -ForegroundColor Cyan
python generate_daily.py

Write-Host "`nДобавление изменений в git..." -ForegroundColor Cyan
git add daily-log.json

Write-Host "`nСоздание коммита..." -ForegroundColor Cyan
$date = Get-Date -Format "yyyy-MM-dd"
git commit -m "Daily update: $date"

Write-Host "`nОтправка на GitHub..." -ForegroundColor Cyan
git push

Write-Host "`n✅ Готово! Коммит отправлен." -ForegroundColor Green

