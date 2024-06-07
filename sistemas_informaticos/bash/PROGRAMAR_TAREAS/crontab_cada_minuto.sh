# Crear una tarea cron que se ejecute cada minuto y que escriba la hora actual en un archivo llamado time.txt en el directorio del usuario actual.
* * * * * echo "$(date)" > time.txt