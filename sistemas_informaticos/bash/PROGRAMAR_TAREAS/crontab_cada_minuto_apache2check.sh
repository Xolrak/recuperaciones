# Crear una tarea cron que se ejecute cada minuto y que compruebe si el servicio apache2 está en ejecución. Si no está en ejecución, debe iniciar el servicio.
* * * * * if ! systemctl is-active --quiet apache2; then systemctl start apache2; fi
