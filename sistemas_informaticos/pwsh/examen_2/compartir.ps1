# compartir.ps1
param (
    [string]$folderPath,
    [string]$shareName,
    [string]$fullControlUser,
    [string]$readOnlyGroup
)

# Verificar si el directorio existe
if (-Not (Test-Path $folderPath)) {
    New-Item -ItemType Directory -Path $folderPath
}

# Crear el recurso compartido
New-SmbShare -Name $shareName -Path $folderPath -FullAccess $fullControlUser -ReadAccess $readOnlyGroup

# Confirmar la creación del recurso compartido
Get-SmbShare -Name $shareName
