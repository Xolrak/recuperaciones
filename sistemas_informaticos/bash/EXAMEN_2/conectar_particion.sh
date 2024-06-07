#!/bin/bash

# Asegurarse de que el disco esté conectado y la partición exista
fdisk -l /dev/sdb

# Crear el sistema de archivos ext4 en la partición
mkfs.ext4 /dev/sdb1

# Crear el directorio de montaje
mkdir /GASOLINERA

# Montar la partición
mount /dev/sdb1 /GASOLINERA

# Verificar que el montaje fue exitoso
df -h
