#!/usr/bin/python3

#Importamos bibliotecas de sistema
import os, sys

#Bucle que recorre 10 elementos

for x in range(1,10,1):
        #Si es menor que diez, metemos 0 a la izquierda
        if x<10:
                os.mkdir("0"+str(x))
        else:
                os.mkdir(x)