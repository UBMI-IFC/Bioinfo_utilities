#!/usr/bin/bash
# EJEMPLO PARA ITERAR EN LOS ARCHIVOS DE UN DIRECTORIO
# Carlos Peralta  | GitHub: cperalta22 | cperalta@ifc.unam.mx
# Instituto de Fisiología Celular, Universidad Nacional Autonoma de Mexico
# GPL3
# 2023

# Esta parte del codigo revisa que exista un argumento con el cual trabajar.
# No es la mejor solucion a este problema, pero es un buen inicio
#
# ¿Como lo mejorarias?
#
if [ $# -lt 1 ];                # Esta expresion se lee: "si el numero de todos los argumentos provistos es menor de uno ..."
then                            # ... entonces
    echo "Este script requiere un argumento para funcionar; el path de un directorio"
    exit
fi                              # el resto de la condicional 'if' concluye diciendo que si la condicion se cumple: escriba un mensaje de error e interrumpa la ejecucion del programa

# A continuacion tomamos el path provisto y realizamos ejecuciones sobre los archivos que contiene
for f in $1/*; do                 # este ciclo 'for' se lee: por cada 'f' (elemento) contenido en el path provisto en el primer argumento realizar:
    head --lines 1 $f         # mostrar la primer linea de cada archivo donde $f
done
