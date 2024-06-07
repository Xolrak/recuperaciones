# Crear una tarea cron que se ejecute el primer día de cada mes a las 12:00 AM que limpie la caché de paquetes del sistema.
0 0 1 * * apt clean
