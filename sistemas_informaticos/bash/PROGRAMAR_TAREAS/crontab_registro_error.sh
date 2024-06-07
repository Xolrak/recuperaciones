# Crear una tarea cron que se ejecute cada 5 minutos y que muestre el uso de memoria en memory_usage.log en el directorio del usuario actual. Redirigir a memory_error.log cualquier salida de error resultante de la ejecución del cron.
*/5 * * * * free > memory_usage.log 2> memory_error.log
