#!/bin/bash

# Montar la partición de backup si es necesario
mount /dev/sdc3 /BACKUPS 

# Formatear el nuevo disco
mkfs.ext4 /dev/sdd

# Montar el nuevo disco
mkdir /GASOLINERA_NUEVO
mount /dev/sdd /GASOLINERA_NUEVO

# Restaurar la última copia completa
ultima_copia=$(ls -t /BACKUPS/GAS-total-*.tar | head -n 1)
tar -xf "$ultima_copia" -C /GASOLINERA_NUEVO

# Aplicar copias incrementales si existen
for incremental in /BACKUPS/GAS-inc-*.tar; do
    tar -xf "$incremental" -C /GASOLINERA_NUEVO
done
