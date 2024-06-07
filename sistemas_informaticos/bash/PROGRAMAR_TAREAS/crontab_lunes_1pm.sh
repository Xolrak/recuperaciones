# Crear una tarea cron que se ejecute todos los lunes a la 1:00 PM que actualice los paquetes del sistema. Volcar en error.log los posibles errores y en resultado.log el resultado de la actualización.
0 13 * * 1 apt update > resultado.log 2> error.log && apt upgrade -y >> resultado.log 2>> error.log
