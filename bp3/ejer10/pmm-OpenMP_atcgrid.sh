#!/bin/bash 
# Órdenes para el sistema de colas: 
#1. Asigna al trabajo un nombre 
#SBATCH --job-name=pmvt 
#2. Asignar el trabajo a una cola (partición) 
#SBATCH --partition=ac 
#2. Asignar el trabajo a un account 
#SBATCH --account=ac 

#Obtener información de las variables del entorno del sistema de colas: 
echo "Id. usuario del trabajo: $SLURM_JOB_USER" 
echo "Id. del trabajo: $SLURM_JOBID" 
echo "Nombre del trabajo especificado por usuario: $SLURM_JOB_NAME" 
echo "Directorio de trabajo (en el que se ejecuta el script): $SLURM_SUBMIT_DIR" 
echo "Cola: $SLURM_JOB_PARTITION" 
echo "Nodo que ejecuta este trabajo:$SLURM_SUBMIT_HOST" 
echo "No de nodos asignados al trabajo: $SLURM_JOB_NUM_NODES" 
echo "Nodos asignados al trabajo: $SLURM_JOB_NODELIST" 
echo "CPUs por nodo: $SLURM_JOB_CPUS_PER_NODE" 

hebras=(
	"1"
	"2"
	"4"
	"6"
	"8"
	"10"
	"12"
)

for i in ${hebras[@]}; 
do 
	echo -e "\n - Con $i hebras:\n"
	export OMP_NUM_THREADS=$i
	echo -e "\n - Para tamaño 500:\n"
	srun ./ejer10 500
	echo -e "\n - Para tamaño 1300:\n"
	srun ./ejer10 1300
done
 
