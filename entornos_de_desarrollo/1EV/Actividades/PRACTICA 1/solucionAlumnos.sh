#/bin/bash

#Bucle que va del 1 al 10
for i in {1..10}
do
        #Si $i es menor que 10, metemos 0 a la izquierda
        if [ $i -lt 10 ]
        then
                mkdir 0$i
        else
                mkdir $i
        fi
done