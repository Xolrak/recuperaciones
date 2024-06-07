$fecha = Get-Date -Format "yyyy-MM-dd"
$origen = "R:\"
$destino = "M:\BACKUP\copy-incr-$fecha.zip"
$filter = "-Include '*.*' -Recurse | Where-Object {$_.LastWriteTime -gt (Get-Date).AddDays(-3)}"
Compress-Archive -Path $origen -DestinationPath $destino -Filter $filter
