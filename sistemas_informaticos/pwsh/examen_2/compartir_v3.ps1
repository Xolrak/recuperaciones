# compartir.ps1

# Función para obtener los detalles del recurso compartido
function ObtenerDetallesRecurso {
    param (
        [string]$prompt
    )
    Write-Host $prompt
    return Read-Host
}

# Obtener detalles del recurso compartido del usuario
$directorio = ObtenerDetallesRecurso -prompt "Ingrese la ruta completa del directorio a compartir:"
$nombreRecurso = ObtenerDetallesRecurso -prompt "Ingrese el nombre del recurso compartido:"
$descripcionRecurso = ObtenerDetallesRecurso -prompt "Ingrese la descripción del recurso compartido:"
$usuarioPermisos = ObtenerDetallesRecurso -prompt "Ingrese el nombre del usuario o grupo al que desea asignar permisos:"
$tipoPermiso = ObtenerDetallesRecurso -prompt "Ingrese el tipo de permiso (FullControl, Change, Read):"

# Comprobar si el directorio existe, si no, crearlo
if (-not (Test-Path $directorio)) {
    New-Item -Path $directorio -ItemType Directory
    Write-Host "Directorio $directorio creado."
} else {
    Write-Host "El directorio $directorio ya existe."
}

# Crear el recurso compartido
New-SmbShare -Name $nombreRecurso -Path $directorio -Description $descripcionRecurso -FullAccess $usuarioPermisos
Write-Host "Recurso compartido $nombreRecurso creado en el directorio $directorio con descripción '$descripcionRecurso'."

# Asignar permisos NTFS
Import-Module -Name NTFSSecurity

switch ($tipoPermiso) {
    "FullControl" {
        Add-NTFSAccess -Path $directorio -Account $usuarioPermisos -AccessRights FullControl
        Write-Host "Permisos de control total asignados a $usuarioPermisos en el directorio $directorio."
    }
    "Change" {
        Add-NTFSAccess -Path $directorio -Account $usuarioPermisos -AccessRights Modify
        Write-Host "Permisos de cambio asignados a $usuarioPermisos en el directorio $directorio."
    }
    "Read" {
        Add-NTFSAccess -Path $directorio -Account $usuarioPermisos -AccessRights ReadAndExecute
        Write-Host "Permisos de lectura asignados a $usuarioPermisos en el directorio $directorio."
    }
    default {
        Write-Host "Tipo de permiso no válido. No se asignaron permisos."
    }
}

# Mostrar permisos resultantes
try {
    Get-NTFSAccess -Path $directorio
} catch {
    Write-Host "Error al obtener los permisos del directorio $directorio."
}
