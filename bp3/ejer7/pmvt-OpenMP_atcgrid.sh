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


export OMP_DYNAMIC=FALSE 
export OMP_NUM_THREADS=12 

export OMP_SCHEDULE="static" 
srun ./ejer7 16000 
export OMP_SCHEDULE="static, 1" 
srun ./ejer7 16000 
export OMP_SCHEDULE="static, 64" 
srun ./ejer7 16000 

export OMP_SCHEDULE="dynamic" 
srun ./ejer7 16000 
export OMP_SCHEDULE="dynamic, 1" 
srun ./ejer7 16000 
export OMP_SCHEDULE="dynamic, 64" 
srun ./ejer7 16000 

export OMP_SCHEDULE="guided" 
srun ./ejer7 16000 
export OMP_SCHEDULE="guided, 1" 
srun ./ejer7 16000 
export OMP_SCHEDULE="guided, 64" 
srun ./ejer7 16000
