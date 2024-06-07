#!/bin/bash

# Comprobar si se ha proporcionado un argumento (nombre del archivo)
if [ $# -eq 0 ]; then
    echo "Uso: $0 <archivo.csv>"
    exit 1
fi

# Eliminar espacios en blanco usando tr
tr -d ' ' < "$1" > temp.csv
mv temp.csv "$1"
