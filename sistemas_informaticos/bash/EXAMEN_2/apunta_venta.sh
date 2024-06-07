#!/bin/bash

# Obtener la fecha y hora actual en el formato deseado
fecha=$(date +"%y-%m-%d-%H-%M")

# Obtener el nombre del usuario actual
vendedor=$(whoami)

# Obtener el día de la semana
diasemana=$(date +"%A")

# Nombre del archivo de ventas
archivo="/GASOLINERA/VENTAS/ventas-${fecha}-${diasemana}.csv"

# Pedir al usuario que introduzca los datos de la venta
read -p "Producto: " producto
read -p "Cantidad: " cantidad

# Escribir los datos en el archivo CSV
echo "${fecha};${producto};${vendedor};${cantidad}" >> "$archivo"
