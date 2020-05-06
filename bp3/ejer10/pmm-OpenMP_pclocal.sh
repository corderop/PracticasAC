#!/bin/bash 

hebras=(
	"1"
	"2"
)

for i in ${hebras[@]}; 
do 
	echo -e "\n - Con $i hebras:\n"
	export OMP_NUM_THREADS=$i
	echo -e "\n - Para tamaño 500:\n"
	./ejer10 500
	echo -e "\n - Para tamaño 1300:\n"
	./ejer10 1300
done
 
