#!/bin/bash

# Comprobar si se ha proporcionado un argumento (mes en formato AA-MM)
if [ $# -eq 0 ]; then
    echo "Uso: $0 <AA-MM>"
    exit 1
fi

mes="$1"
archivo_salida="ventas-${mes}.txt"

# Recorrer los archivos CSV del mes y extraer información relevante
for archivo in /GASOLINERA/VENTAS/ventas-${mes}-*.csv; do
    while IFS=';' read -r fecha producto vendedor cantidad; do
        echo -e "${vendedor}\t${cantidad}"
    done < "$archivo"
done | sort > "$archivo_salida" # Ordenar alfabéticamente y guardar en el archivo de salida
