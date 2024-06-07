#!/bin/bash

# Función para dibujar una pirámide normal
function draw_pyramid() {
    read -p "Ingrese la altura de la pirámide: " height
    for (( i=1; i<=height; i++ ))
    do
        for (( j=i; j<height; j++ ))
        do
            echo -n " "
        done
        for (( k=1; k<=(2*i-1); k++ ))
        do
            echo -n "*"
        done
        echo
    done
}

# Función para dibujar una pirámide invertida
function draw_inverted_pyramid() {
    read -p "Ingrese la altura de la pirámide: " height
    for (( i=height; i>=1; i-- ))
    do
        for (( j=height; j>i; j-- ))
        do
            echo -n " "
        done
        for (( k=1; k<=(2*i-1); k++ ))
        do
            echo -n "*"
        done
        echo
    done
}

# Función para dibujar una pirámide apuntando a la derecha
function draw_right_pointing_pyramid() {
    read -p "Ingrese la altura de la pirámide: " height
    for (( i=1; i<=height; i++ ))
    do
        for (( j=1; j<=i; j++ ))
        do
            echo -n "*"
        done
        echo
    done
    for (( i=height-1; i>=1; i-- ))
    do
        for (( j=1; j<=i; j++ ))
        do
            echo -n "*"
        done
        echo
    done
}
# Función para dibujar una pirámide apuntando a la izquierda
function draw_left_pointing_pyramid() {
    read -p "Ingrese la altura de la pirámide: " height
    for (( i=1; i<=height; i++ ))
    do
        for (( j=i; j<height; j++ ))
        do
            echo -n " "
        done
        for (( k=1; k<=i; k++ ))
        do
            echo -n "*"
        done
        echo
    done
    for (( i=height-1; i>=1; i-- ))
    do
        for (( j=i; j<height; j++ ))
        do
            echo -n " "
        done
        for (( k=1; k<=i; k++ ))
        do
            echo -n "*"
        done
        echo
    done
}

# Mostrar el menú
while true
do
    echo "Menú de Pirámides"
    echo "1. Pirámide normal"
    echo "2. Pirámide invertida"
    echo "3. Pirámide apuntando a la derecha"
    echo "4. Pirámide apuntando a la izquierda"
    echo "5. Salir"
    read -p "Elija una opción: " option

    case $option in
        1) draw_pyramid ;;
        2) draw_inverted_pyramid ;;
        3) draw_right_pointing_pyramid ;;
        4) draw_left_pointing_pyramid ;;
        5) break ;;
        *) echo "Opción no válida. Inténtelo de nuevo." ;;
    esac
done