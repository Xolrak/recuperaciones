# piramide_menu.ps1

# Función para mostrar una pirámide normal
function PiramideNormal {
    param (
        [int]$altura
    )
    for ($i = 1; $i -le $altura; $i++) {
        Write-Host (" " * ($altura - $i) + "*" * (2 * $i - 1))
    }
}

# Función para mostrar una pirámide invertida
function PiramideInvertida {
    param (
        [int]$altura
    )
    for ($i = $altura; $i -ge 1; $i--) {
        Write-Host (" " * ($altura - $i) + "*" * (2 * $i - 1))
    }
}

# Función para mostrar una pirámide con la punta hacia la derecha
function PiramideDerecha {
    param (
        [int]$altura
    )
    for ($i = 1; $i -le $altura; $i++) {
        Write-Host ("*" * $i)
    }
    for ($i = $altura - 1; $i -ge 1; $i--) {
        Write-Host ("*" * $i)
    }
}

# Función para mostrar una pirámide con la punta hacia la izquierda
function PiramideIzquierda {
    param (
        [int]$altura
    )
    for ($i = 1; $i -le $altura; $i++) {
        Write-Host (" " * ($altura - $i) + "*" * $i)
    }
    for ($i = $altura - 1; $i -ge 1; $i--) {
        Write-Host (" " * ($altura - $i) + "*" * $i)
    }
}

# Función principal para mostrar el menú y recibir la entrada del usuario
function MostrarMenu {
    Write-Host "Seleccione el tipo de pirámide:"
    Write-Host "1. Pirámide Normal"
    Write-Host "2. Pirámide Invertida"
    Write-Host "3. Pirámide con la Punta hacia la Derecha"
    Write-Host "4. Pirámide con la Punta hacia la Izquierda"
    Write-Host "5. Salir"

    $opcion = Read-Host "Ingrese una opción (1-5)"
    return $opcion
}

# Función para iniciar el script
function Iniciar {
    while ($true) {
        $opcion = MostrarMenu

        if ($opcion -eq 5) {
            break
        }

        $altura = Read-Host "Ingrese la altura de la pirámide" -AsInt

        switch ($opcion) {
            1 { PiramideNormal -altura $altura }
            2 { PiramideInvertida -altura $altura }
            3 { PiramideDerecha -altura $altura }
            4 { PiramideIzquierda -altura $altura }
            default { Write-Host "Opción no válida, intente de nuevo." }
        }
    }
}

# Iniciar el script
Iniciar
