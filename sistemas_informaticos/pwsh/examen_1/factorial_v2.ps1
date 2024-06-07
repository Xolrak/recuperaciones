function Get-Factorial {
    # Función recursiva para calcular el factorial de un número
    param(
        [Parameter(Mandatory = $true)]  # Parámetro obligatorio
        [int]$n                        # Número del cual calcular el factorial
    )

    if ($n -lt 0) {
        # Manejo de números negativos
        Write-Host "El factorial no está definido para números negativos."
        return
    } elseif ($n -eq 0) {
        # Caso base: factorial de 0 es 1
        return 1 
    } else {
        # Cálculo recursivo del factorial
        return ($n * (Get-Factorial ($n - 1))) 
    }
}

do {
    # Bucle para calcular factoriales repetidamente
    $n = Read-Host "Introduce un número entero positivo (o 'q' para salir):"
    if ($n -eq 'q') {
        # Salir del bucle si el usuario ingresa 'q'
        break
    }

    # Intenta convertir la entrada a un número entero
    $n = [int]::TryParse($n, [ref]$null)

    if ($n) {
        # Si la conversión es exitosa, calcula y muestra el factorial
        $factorial = Get-Factorial $n
        Write-Host "El factorial de $n es: $factorial"
    } else {
        # Si la conversión falla, muestra un mensaje de error
        Write-Host "Entrada no válida. Por favor, introduce un número entero positivo o 'q'."
    }
} while ($true) 
