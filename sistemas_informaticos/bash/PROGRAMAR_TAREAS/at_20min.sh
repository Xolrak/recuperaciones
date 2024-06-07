# Programar un trabajo para que se ejecute dentro de 20 minutos que muestre los procesos en ejecución del usuario actual.
echo "ps -u $(whoami)" | at now + 20 minutes