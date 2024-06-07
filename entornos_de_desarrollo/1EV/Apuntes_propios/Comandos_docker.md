# 🎨 COMANDOS DOCKER 🐳
## 🏃 docker **run**
Con este comando se crea y ejecuta un contenedor

### 🚀 EJEMPLO 1
```bash
docker run -it --name=cont1 ubuntu /bin/bash
```
* **-it**: La "i" mantiene el contenedor abierto incluso si cerramos la terminal y la "t" inicia una terminal
* **--name=cont1**: Asigna un nombre al contenedor
* **ubuntu**: Instala una imagen de sistema "ubuntu"
* **/bin/bash**: Abre la terminal con la shell Bash

### ⚙️ EJEMPLO 2
```bash
docker run -d -p 1200:80 nginx
```
* **-d**: Inicia el contenedor en modo daemon
* **- p 1200:80**: Abre el puerto 1200 de la maquina anfitriona y el 80 del contenedor
* **nginx**: Instala una imagen de sistema ""nginx"

### 🍃 EJEMPLO 3
```bash
docker run -it -e MENSAJE=HOLA ubuntu:14.04 /bin/bash
```
* **-it**: La "i" mantiene el contenedor abierto incluso si cerramos la terminal y la "t" inicia una terminal
* **-e MENSAJE=HOLA**: Crea una variable de entorno "MENSAJE" con valor "HOLA"
* **ubuntu:14.04**: Instala una imagen de sistema "ubuntu" en su versión "14.04"
* **/bin/bash**: Abre la terminal con la shell Bash

## 🔍 docker **ps**
```bash
docker ps -a
```
* **ps**: Nos permite ver los contenedores en ejecución, caso de usar "-a" veremos también los apagados

## 🛠️ docker **exec**

### 🔬 EJEMPLO 1
```bash
docker exec -it -e FICHERO=prueba cont1 /bin/bash
```
* **exec**: Permite ejecutar comandos en un contenedor ya encendido
* **-e FICHERO=prueba**: Crea una variable de entorno "FICHERO" con valor "prueba"
* **cont1**: Contenedor en el que se ejecutaran los comandos
* **/bin/bash**: Abre la terminal con la shell Bash

### 🤖 EJEMPLO 2
```bash
docker exec -d cont touch /tmp/prueba
```
* **exec**: Permite ejecutar comandos en un contenedor ya encendido
* **-d**: Inicia el contenedor en modo daemon
* **cont1**: Contenedor en el que se ejecutaran los comandos
* **touch /tmp/prueba**: Ejecuta este comando dentro del servidor

## 🔗 docker attach
```bash
docker attach idcontainer
```
* **attach**: Enlaza nuestra terminal con la entrada/salida del contenedor, en caso de que el contenedor esté iniciado con "-it" podremos ejecutar comandos, en caso de que el contenedor se iniciara con "-d" solo podremos ver la salida

## 📜 docker logs
```bash
docker logs -n 10 idcontainer
```
* **logs -n 10**: Muestra las 10 ultimas lineas de salida (en este ejemplo) del proceso en ejecución del contenedor
## 🔄 docker cp
```bash
docker cp idcontainer:/tmp/prueba ./
```
* **cp**: Este comando nos permite copiar archivos entre la máquina anfitriona y la máquina virtual, o viceversa