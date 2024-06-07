# alta.ps1
param (
    [Parameter(Mandatory=$true, HelpMessage="Ruta completa al archivo CSV con los usuarios")]
    [string]$csvPath
)

# Validación del archivo CSV (asegura que el archivo existe y es un archivo CSV)
if (!(Test-Path $csvPath) -or ($csvPath -notmatch "\.csv$")) {
    Write-Error "Error: La ruta '$csvPath' no es válida o no es un archivo CSV."
    exit 1
}

# Leer los usuarios del archivo CSV
try {
    $users = Import-Csv -Path $csvPath
} catch {
    Write-Error "Error al importar el CSV: $_"
    exit 1
}

# Verificar que el CSV tenga las columnas necesarias (USUARIO y GRUPO)
$requiredHeaders = @("USUARIO", "GRUPO")
if (-not ($users.psobject.Properties.Name | Where-Object { $requiredHeaders -contains $_ })) {
    Write-Error "Error: El CSV no tiene las columnas necesarias (USUARIO y GRUPO)."
    exit 1
}

foreach ($user in $users) {
    $username = $user.USUARIO
    $group = $user.GRUPO
    $password = "$username`123" # Contraseña USUARIO+123

    # Verificar si el usuario ya existe
    if (Get-LocalUser -Name $username -ErrorAction SilentlyContinue) {
        Write-Host "El usuario '$username' ya existe." -ForegroundColor Yellow
    } else {
        # Crear el usuario
        try {
            New-LocalUser -Name $username -Password (ConvertTo-SecureString $password -AsPlainText -Force) -FullName $username -Description "Usuario del grupo $group"
        } catch {
            Write-Error "Error al crear el usuario '$username': $_"
            continue # Saltar al siguiente usuario en caso de error
        }
        # Añadir el usuario al grupo correspondiente
        try {
            Add-LocalGroupMember -Group $group -Member $username
        } catch {
            Write-Error "Error al añadir '$username' al grupo '$group': $_"
        }

        Write-Host "Usuario '$username' creado y añadido al grupo '$group'." -ForegroundColor Green
    }
}
