# Pide al usuario que ingrese el tamaño mínimo de archivo
$tamañoMinimo = Read-Host "Introduce el tamaño mínimo de archivo en bytes:"
$tamañoMinimo = [long]::TryParse($tamañoMinimo, [ref]$null)

# Verifica si la entrada es válida (un número entero positivo)
if (-not $tamañoMinimo) {
    Write-Host "Entrada no válida. Por favor, introduce un número entero positivo."
    return
}

# Define la ruta del archivo de salida en el escritorio
$rutaEscritorio = [Environment]::GetFolderPath("Desktop") + "\borrar.txt"

# Busca archivos grandes y escribe sus nombres y rutas en el archivo de salida
Get-ChildItem -Recurse | Where-Object { $_.Length -gt $tamañoMinimo } | ForEach-Object {
    Add-Content $rutaEscritorio "$_ $($_.FullName)"  # Escribe nombre y ruta en el archivo
}
