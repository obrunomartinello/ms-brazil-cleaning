$files = Get-ChildItem -Path "assets\portfolio\*.jpeg"
foreach ($file in $files) {
    $newName = $file.FullName -replace '\.jpeg$', '.webp'
    Write-Host "Converting $($file.Name)..."
    npx -y sharp-cli@^3.0.0 resize 1200 --input $file.FullName --output $newName --format webp --quality 80
    Remove-Item $file.FullName
}
Write-Host "Done!"
