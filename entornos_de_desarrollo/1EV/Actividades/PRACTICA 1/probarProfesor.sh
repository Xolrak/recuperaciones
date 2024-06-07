#!/bin/bash

#Bucle del 1 al 10
for i in {1..10}
do
	# Si es menor que 0, al ejecutar docker exec metemos 0 izquierda
	# el comando test -d comprueba si existe un directorio
	# $1 es el identificador o nombre del contenedor
	if [ $i -lt 10 ]
	then
		docker exec -it $1 ejercicio -d /root/0$i
	else
		docker exec -it $1 ejercicio -d /root/$i
	fi

	# La variable $? devuelve 0 si la orden se ha ejecutado correctamente,
	# o distinto de cero en caso contrario. 
	# Al enlazar la terminal en docker exec, el valor de $? es
	# el valor de la ejecución de la orden en el contenedor
	if [ $? -ne 0 ] 
	then
		echo "PRÁCTICA INCORRECTA"
		echo "ERROR EN PRUEBA ${i}"
		exit
	fi	
done
echo "PRÁCTICA OK"
