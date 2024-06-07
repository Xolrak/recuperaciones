# permisos_ntfs.ps1

# Comprobar si el directorio existe, si no, crearlo
$directorio = "C:\DAW-SI"
if (-not (Test-Path $directorio)) {
    New-Item -Path $directorio -ItemType Directory
    Write-Host "Directorio $directorio creado."
} else {
    Write-Host "El directorio $directorio ya existe."
}

# Comprobar si el usuario vicent existe, si no, crearlo
$usuarioVicent = "vicent"
if (-not (Get-LocalUser -Name $usuarioVicent -ErrorAction SilentlyContinue)) {
    $contrasena = "$usuarioVicent`123"
    New-LocalUser -Name $usuarioVicent -Password (ConvertTo-SecureString $contrasena -AsPlainText -Force) -Description "Usuario creado por permisos_ntfs.ps1" -UserMayNotChangePassword -PasswordNeverExpires
    Write-Host "Usuario $usuarioVicent creado con éxito."
} else {
    Write-Host "El usuario $usuarioVicent ya existe."
}

# Comprobar si el grupo alumnes existe, si no, crearlo
$grupoAlumnes = "alumnes"
if (-not (Get-LocalGroup -Name $grupoAlumnes -ErrorAction SilentlyContinue)) {
    New-LocalGroup -Name $grupoAlumnes -Description "Grupo creado por permisos_ntfs.ps1"
    Write-Host "Grupo $grupoAlumnes creado con éxito."
} else {
    Write-Host "El grupo $grupoAlumnes ya existe."
}

# Asignar permisos NTFS

# Importar el módulo de FileSystemSecurity para manejar permisos NTFS
Import-Module -Name NTFSSecurity

# Asignar control total a vicent
try {
    Add-NTFSAccess -Path $directorio -Account $usuarioVicent -AccessRights FullControl
    Write-Host "Permisos de control total asignados a $usuarioVicent en el directorio $directorio."
} catch {
    Write-Host "Error al asignar permisos a $usuarioVicent."
}

# Asignar permisos de lectura al grupo alumnes
try {
    Add-NTFSAccess -Path $directorio -Account $grupoAlumnes -AccessRights ReadAndExecute
    Write-Host "Permisos de lectura asignados al grupo $grupoAlumnes en el directorio $directorio."
} catch {
    Write-Host "Error al asignar permisos al grupo $grupoAlumnes."
}

# Mostrar permisos resultantes
try {
    Get-NTFSAccess -Path $directorio
} catch {
    Write-Host "Error al obtener los permisos del directorio $directorio."
}
