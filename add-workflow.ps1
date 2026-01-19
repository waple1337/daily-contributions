# Скрипт для добавления workflow файла
Write-Host "Добавление workflow файла..." -ForegroundColor Cyan

git add .github/workflows/daily-commit.yml
git commit -m "Add daily commit workflow"
git push

Write-Host "✅ Workflow файл добавлен!" -ForegroundColor Green
Write-Host ""
Write-Host "Теперь перейдите в Settings → Actions → General → Workflow permissions → Read and write permissions" -ForegroundColor Yellow

