#!/bin/bash

# Función para dibujar un triángulo normal
function draw_triangle() {
    read -p "Ingrese la altura del triángulo: " height
    for (( i=1; i<=height; i++ ))
    do
        for (( j=1; j<=i; j++ ))
        do
            echo -n "*"
        done
        echo
    done
}

# Función para dibujar un triángulo invertido
function draw_inverted_triangle() {
    read -p "Ingrese la altura del triángulo: " height
    for (( i=height; i>=1; i-- ))
    do
        for (( j=1; j<=i; j++ ))
        do
            echo -n "*"
        done
        echo
    done
}

# Función para dibujar un triángulo apuntando a la derecha
function draw_right_pointing_triangle() {
    read -p "Ingrese la altura del triángulo: " height
    for (( i=1; i<=height; i++ ))
    do
        for (( j=1; j<i; j++ ))
        do
            echo -n " "
        done
        for (( k=i; k<=height; k++ ))
        do
            echo -n "*"
        done
        echo
    done
}

# Función para dibujar un triángulo apuntando a la izquierda
function draw_left_pointing_triangle() {
    read -p "Ingrese la altura del triángulo: " height
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
}

# Mostrar el menú
while true
do
    echo "Menú de Triángulos"
    echo "1. Triángulo normal"
    echo "2. Triángulo invertido"
    echo "3. Triángulo apuntando a la derecha"
    echo "4. Triángulo apuntando a la izquierda"
    echo "5. Salir"
    read -p "Elija una opción: " option

    case $option in
        1) draw_triangle ;;
        2) draw_inverted_triangle ;;
        3) draw_right_pointing_triangle ;;
        4) draw_left_pointing_triangle ;;
        5) break ;;
        *) echo "Opción no válida. Inténtelo de nuevo." ;;
    esac
done