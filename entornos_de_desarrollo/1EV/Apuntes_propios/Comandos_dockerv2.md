# 🐳 Comandos Docker Esenciales 🛠️

## 🏃 docker run
Crea y ejecuta un contenedor a partir de una imagen.
```bash
docker run [opciones] imagen [comando] [argumentos]
```
| Opción | Descripción |
| :--- | :-: |
| -it | Modo interactivo con terminal. |
| -d | Modo daemon (segundo plano). |
| -p | Expone los puertos (anfitrion:contenedor). |
| --name= | Asigna un nombre al contenedor. |
| -e | Define variables de entorno. |

| Ejemplos | Descripción |
| :--- | :-: |
|docker run -it --name mi_ubuntu ubuntu	| Inicia un contenedor Ubuntu interactivo llamado "mi_ubuntu" con una shell Bash.|
| docker run -d -p 8080:80 nginx | Inicia un servidor web Nginx en segundo plano, accesible en el puerto 8080 de la máquina anfitriona. |
| docker run -e MENSAJE="Hola" ubuntu:14.04 | Inicia un contenedor Ubuntu 14.04 con la variable de entorno MENSAJE definida como "Hola". |

## 🔍 docker ps
Lista los contenedores:

* **docker ps**: Muestra los contenedores en ejecución.
* **docker ps -a**: Muestra todos los contenedores (incluidos los detenidos).

## 🛠️ docker exec
Ejecuta comandos dentro de un contenedor en ejecución:
```bash
docker exec [opciones] contenedor comando [argumentos]
```
| Opción | Descripción |
|---|---|
| -it | Modo interactivo con terminal. |
|-d | Modo daemon (segundo plano). |
| -e | Define variables de entorno. |

| Ejemplos | Descripción |
| :--- | :-: |
|docker exec -it mi_ubuntu /bin/bash | Abre una shell Bash interactiva en el contenedor "mi_ubuntu". |
| docker exec -d mi_ubuntu touch /tmp/archivo.txt | Crea un archivo vacío llamado "archivo.txt" en el directorio /tmp del contenedor "mi_ubuntu" en segundo plano. |

## 🔗 docker attach
Adjunta tu terminal a un contenedor en ejecución:
```bash
docker attach idcontainer
```

## 📜 docker logs
Muestra los registros (logs) de un contenedor:
```bash
docker logs [opciones] contenedor
```
| Ejemplo | Descripción |
| :--- | :-: |
| docker logs -n 10 mi_ubuntu | Muestra las 10 últimas lineas del contenedor "mi_ubuntu" |

## 🔄 docker cp
Copia archivos entre el contenedor y la máquina anfitriona:
```bash
docker cp contenedor:ruta_origen ruta_destino
```
| Ejemplos | Descripción |
| :--- | :-: |
| docker cp mi_ubuntu:/tmp/archivo.txt ./ | Copia el archivo "archivo.txt" del contenedor "mi_ubuntu" al directorio actual de la máquina anfitriona. |
| docker cp ./archivo.txt mi_ubuntu:/tmp/ | Copia el archivo "archivo.txt" de la máquina anfitriona al directorio /tmp del contenedor "mi_ubuntu". |