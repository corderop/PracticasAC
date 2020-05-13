#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX 11585

double m1[MAX][MAX], m2[MAX][MAX], m3[MAX][MAX]; 

int main(int argc, char **argv)  {
	int i, j, k;
	clock_t t1, t2;
	double total;

	if(argc < 2){
		fprintf(stderr,"Falta tamaño de la matriz (debe de ser cuadrada)\n");
		exit(-1);
	}

	// Tamaño de la matriz pasado por parámetro
	unsigned int tam = atoi(argv[1]);

	if(tam < 2 || tam>MAX){
		fprintf(stderr, "El tamaño no puede ser menor a 2 y mayor que ");
		exit(-1);
	}

	// Inicializamos la matriz y los vectores
	for(i=0; i<tam; i++){
		for(j=0; j<tam; j++){
			m1[i][j] = 0;
			m2[i][j] = 2;
			m3[i][j] = 2;
		}
	}

	// Inicializamos la primera variable de tiempo
	t1 = clock();

	// Calculamos el producto m1 = m2*m3
	for(i=0; i<tam; i++){
		for(j=0; j<tam; j++){
			for(k=0; k<tam; k+=5){
				m1[i][j] += (m2[i][k]*m3[k][j]);
				m1[i][j] += (m2[i][k+1]*m3[k+1][j]);
				m1[i][j] += (m2[i][k+2]*m3[k+2][j]);
				m1[i][j] += (m2[i][k+3]*m3[k+3][j]);
				m1[i][j] += (m2[i][k+4]*m3[k+4][j]);
			}
		}
	}

	// Obtenemos el tiempo total transcurrido
	t2 = clock();
	total = (double)(t2-t1)/CLOCKS_PER_SEC;

	// Para tamaños pequeños (hasta tam=11), imprimimos todas las componentes del vector resultante
	// y el tiempo de ejecución
	if(tam <= 11){
		printf("Tamaño matriz: %i\n Tiempo de ejecución: %f\n", tam, total);

		for(i=0; i<tam; i++){
			for(j=0; j<tam; j++){
				printf("m1[%i][%i] = %f\n", i, j, m1[i][j]);
			}
		}
	}

	// Para tamaños superiores, imprimimos el tiempo de ejecución y la primera y última componente del vector
	else{
		printf("Tamaño vectores: %i\n Tiempo de ejecución: %f\n Primera componente: %f\n Última componente: %f\n",
		tam, total, m1[0][0], m1[tam-1][tam-1]);
	}

	return 0;
}

