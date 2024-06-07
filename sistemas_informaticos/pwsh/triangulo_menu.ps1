# triangulo_menu.ps1

# Función para mostrar un triángulo normal (rectángulo con hipotenusa en la parte superior derecha)
function TrianguloNormal {
    param (
        [int]$altura
    )
    for ($i = 1; $i -le $altura; $i++) {
        Write-Host ("*" * $i)
    }
}

# Función para mostrar un triángulo invertido (rectángulo con hipotenusa en la parte inferior izquierda)
function TrianguloInvertido {
    param (
        [int]$altura
    )
    for ($i = $altura; $i -ge 1; $i--) {
        Write-Host ("*" * $i)
    }
}

# Función para mostrar un triángulo con la punta hacia la derecha (rectángulo con hipotenusa en la parte superior izquierda)
function TrianguloDerecha {
    param (
        [int]$altura
    )
    for ($i = 1; $i -le $altura; $i++) {
        Write-Host (" " * ($altura - $i) + "*" * $i)
    }
}

# Función para mostrar un triángulo con la punta hacia la izquierda (rectángulo con hipotenusa en la parte inferior derecha)
function TrianguloIzquierda {
    param (
        [int]$altura
    )
    for ($i = 1; $i -le $altura; $i++) {
        Write-Host ("*" * ($altura - $i + 1) + " " * ($i - 1))
    }
}

# Función principal para mostrar el menú y recibir la entrada del usuario
function MostrarMenu {
    Write-Host "Seleccione el tipo de triángulo:"
    Write-Host "1. Triángulo Normal"
    Write-Host "2. Triángulo Invertido"
    Write-Host "3. Triángulo con la Punta hacia la Derecha"
    Write-Host "4. Triángulo con la Punta hacia la Izquierda"
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

        $altura = Read-Host "Ingrese la altura del triángulo" -AsInt

        switch ($opcion) {
            1 { TrianguloNormal -altura $altura }
            2 { TrianguloInvertido -altura $altura }
            3 { TrianguloDerecha -altura $altura }
            4 { TrianguloIzquierda -altura $altura }
            default { Write-Host "Opción no válida, intente de nuevo." }
        }
    }
}

# Iniciar el script
Iniciar
