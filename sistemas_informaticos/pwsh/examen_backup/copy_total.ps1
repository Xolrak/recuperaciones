$fecha = Get-Date -Format "yyyy-MM-dd"
$origen = "R:\"
$destino = "M:\BACKUP\copy-total-$fecha.zip"
Compress-Archive -Path $origen -DestinationPath $destino
