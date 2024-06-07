function IniciarProceso($nombreProceso) {
    # Verifica si el proceso ya está en ejecución
    if (Get-Process $nombreProceso -ErrorAction SilentlyContinue) {
        Write-Host "El proceso '$nombreProceso' ya se está ejecutando."
    } else {
        # Inicia el proceso si no está en ejecución
        Start-Process $nombreProceso
        Write-Host "El proceso '$nombreProceso' se ha iniciado."
    }
}

do {
    # Menú de opciones
    Write-Host "A. Lista procesos"
    Write-Host "B. Inicia proceso"
    Write-Host "C. Para proceso"
    Write-Host "D. Salir"
    $opcion = Read-Host "Seleccione una opcion"

    switch ($opcion) {
        'A' { 
            # Lista todos los procesos en ejecución
            Get-Process 
        }
        'B' { 
            # Pide el nombre del proceso y lo inicia
            $nombreProceso = Read-Host "Ingrese el nombre del proceso a iniciar"
            IniciarProceso $nombreProceso 
        }
        'C' { 
            # Pide el nombre del proceso y lo detiene (corregido)
            $nombreProceso = Read-Host "Ingrese el nombre del proceso a detener"
            if (Get-Process $nombreProceso -ErrorAction SilentlyContinue) { # Verifica si el proceso existe antes de detenerlo
                Stop-Process -Name $nombreProceso -Force # Detener el proceso por su nombre y forzar la detención si es necesario
                Write-Host "El proceso '$nombreProceso' se ha detenido."
            } else {
                Write-Host "El proceso '$nombreProceso' no está en ejecución."
            }
        }
        'D' { 
            # Sale del bucle
            break 
        }
        default { 
            # Mensaje de error para opciones inválidas
            Write-Host "Opcion invalida" 
        }
    }
} while ($opcion -ne 'D') # Continúa el bucle hasta que se elija la opción 'D'
