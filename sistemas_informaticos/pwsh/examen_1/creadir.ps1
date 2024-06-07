# Función para mostrar el menú interactivo
function Show-Menu {
    Clear-Host
    Write-Host "Selecciona una opción:"
    Write-Host "1. Crear un directorio"
    Write-Host "2. Salir"
}

# Función para crear un directorio
function Create-Directory {
    $nombreDirectorio = Read-Host "Introduce el nombre del nuevo directorio:"
    $rutaPadre = Read-Host "Introduce la ruta completa del directorio padre (o presiona Enter para usar el directorio actual):"

    if (-not $rutaPadre) {
        $rutaPadre = Get-Location  # Usar el directorio actual si no se proporciona una ruta
    }

    $rutaCompleta = Join-Path $rutaPadre $nombreDirectorio

    if (Test-Path $rutaCompleta) {
        Write-Host "El directorio '$rutaCompleta' ya existe."
    } else {
        try {
            New-Item -ItemType Directory -Path $rutaCompleta
            Write-Host "Directorio '$rutaCompleta' creado con éxito."
        } catch {
            Write-Host "Error al crear el directorio: $($_.Exception.Message)"
        }
    }
}

# Bucle principal del programa
do {
    Show-Menu  # Mostrar el menú

    $opcion = Read-Host "Opción:"

    switch ($opcion) {
        1 { Create-Directory }  # Llamar a la función para crear un directorio
        2 { break }             # Salir del bucle si se elige la opción 2
        default { Write-Host "Opción inválida." }  # Manejar opciones no válidas
    }

    # Pausa para que el usuario pueda ver el resultado
    Read-Host "Presiona Enter para continuar..."

} while ($true)  # Repetir el bucle hasta que el usuario elija salir
