# alta.ps1
param (
    [string]$csvPath
)

# Leer los usuarios del archivo CSV
$users = Import-Csv -Path $csvPath

foreach ($user in $users) {
    $username = $user.USUARIO
    $group = $user.GRUPO
    $password = "$username`123" # Contraseña USUARIO+123

    # Verificar si el usuario ya existe
    if (Get-LocalUser -Name $username -ErrorAction SilentlyContinue) {
        Write-Host "El usuario $username ya existe."
    } else {
        # Crear el usuario
        New-LocalUser -Name $username -Password (ConvertTo-SecureString $password -AsPlainText -Force) -FullName $username -Description "Usuario del grupo $group"
        # Añadir el usuario al grupo correspondiente
        Add-LocalGroupMember -Group $group -Member $username
        Write-Host "Usuario $username creado y añadido al grupo $group."
    }
}
