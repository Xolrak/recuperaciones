# compartir.ps1
param (
    [Parameter(Mandatory=$true, HelpMessage="Ruta completa del directorio a compartir")]
    [string]$folderPath,
    [Parameter(Mandatory=$true, HelpMessage="Nombre del recurso compartido")]
    [string]$shareName,
    [Parameter(Mandatory=$true, HelpMessage="Usuario con acceso completo (ej. dominio\usuario)")]
    [string]$fullControlUser,
    [Parameter(Mandatory=$true, HelpMessage="Grupo con acceso de solo lectura (ej. dominio\grupo)")]
    [string]$readOnlyGroup
)

# Verificar si el directorio existe y crearlo si no existe
if (-Not (Test-Path $folderPath)) {
    try {
        New-Item -ItemType Directory -Path $folderPath | Out-Null # Ocultar la salida de New-Item
        Write-Host "Se ha creado el directorio '$folderPath'." -ForegroundColor Green
    } catch {
        Write-Error "Error al crear el directorio: $_"
        exit 1
    }
}

# Crear el recurso compartido (con manejo de errores)
try {
    $existingShare = Get-SmbShare -Name $shareName -ErrorAction SilentlyContinue
    if ($existingShare) {
        Write-Warning "El recurso compartido '$shareName' ya existe. Sobrescribiendo configuración..."
        Remove-SmbShare -Name $shareName -Force 
    }

    New-SmbShare -Name $shareName -Path $folderPath -FullAccess $fullControlUser -ReadAccess $readOnlyGroup | Out-Null
    Write-Host "Se ha creado/actualizado el recurso compartido '$shareName'." -ForegroundColor Green
} catch {
    Write-Error "Error al crear el recurso compartido: $_"
    exit 1
}

# Confirmar la creación del recurso compartido y mostrar detalles
try {
    $createdShare = Get-SmbShare -Name $shareName
    Write-Host "Detalles del recurso compartido:" -ForegroundColor Cyan
    $createdShare | Format-List # Mostrar detalles en formato de lista
} catch {
    Write-Error "Error al obtener detalles del recurso compartido: $_"
}
