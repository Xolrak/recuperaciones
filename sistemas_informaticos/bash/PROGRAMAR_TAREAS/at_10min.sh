# Programar un trabajo para que se ejecute dentro de 10 minutos que cree un archivo llamado test.txt en el directorio del usuario actual.
echo "touch test.txt" | at now + 10 minutes
