# Synchronise le contenu du dossier joueurs de la campagne vers le site Quartz
$source = Join-Path $PSScriptRoot "..\Scénarios Carathis\joueurs"
$destination = Join-Path $PSScriptRoot "content"

Write-Host "Synchronisation de $source vers $destination..." -ForegroundColor Cyan
robocopy "$source" "$destination" /E /XD ".obsidian" /NFL /NDL /NJH /NJS

if ($LASTEXITCODE -le 7) {
    Write-Host "Synchronisation terminée avec succès." -ForegroundColor Green
    exit 0
} else {
    Write-Host "Erreur lors de la synchronisation (code: $LASTEXITCODE)." -ForegroundColor Red
    exit $LASTEXITCODE
}
