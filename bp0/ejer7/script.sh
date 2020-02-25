#!/bin/bash
# Órdenes para el sistema de colas:
#1. Asigna al trabajo un nombre
#SBATCH --job-name=helloOMP
#2. Asignar el trabajo a una cola (partición)
#SBATCH --partition=ac
#2. Asignar el trabajo a un account
#SBATCH --account=ac

componentes=(
    "65536"
    "131072"
    "262144"
    "524288"
    "1048576"
    "2097152"
    "4194304"
    "8388608"
    "16777216"
    "33554432"
    "67108864"
)

for i in ${componentes[@]}; 
do
    ./SumaVectores $i
    printf "\n\n"
done
 