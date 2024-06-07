# Crear una tarea cron que se ejecute todos los días a las 3:00 PM que haga una copia de seguridad de los ficheros del directorio /home al directorio /backup.
0 15 * * * cp -r /home/* /backup
