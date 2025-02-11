#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h>  // biblioteca donde se encuentra la función printf()
#include <time.h> // biblioteca donde se encuentra la función clock_gettime() 
#include <omp.h>


#define VECTOR_DYNAMIC  // descomentar para que los vectores sean variables ...
			// dinámicas (memoria reutilizable durante la ejecución)

int main(int argc, char **argv)  {
	int i, j;
	omp_sched_t tipo;
	int c;

	if(argc < 2){
		printf("Faltan nº componentes del vector\n");
		exit(-1);
	}

	// Tamaño de la matriz pasado por parámetro
    unsigned int n = atoi(argv[1]);

    if(n < 2){
    	fprintf(stderr, "El tamaño no puede ser menor a 2");
    	exit(-1);
    }

	#ifdef VECTOR_DYNAMIC
			// Reserva de memoria para la versión dinámica
			double *v1, *v2, **m;

			v1 = (double*) malloc(n*sizeof(double));
			v2 = (double*) malloc(n*sizeof(double));
			m = (double**) malloc(n*sizeof(double*));

			for(i=0; i<n; i++){
				m[i] = (double*) malloc(n*sizeof(double));
			}
	#endif

	// Inicialización --------------------
	for(i=0; i<n; i++)
		v1[i] = 4;

	for(i=0; i<n; i++){
		for(j=0; j<n; j++){
			if(i<=j)
				m[i][j] = 1;
			else
				m[i][j] = 0;
			
		}
	}

	// Calculo de la fórmula
	double t1 = omp_get_wtime();

	#pragma omp parallel shared(m, v2, v1)
	{
		#pragma omp single
		{
			omp_get_schedule(&tipo, &c);
			printf("run-sched-var:\t Tipo: %d \t Chunks: %d\n\n", tipo, c);
		}

		#pragma omp for private(j) schedule(runtime)
		for(i=0; i<n; i++){
			v2[i] = 0;

			for(j=i; j<n; j++){
				v2[i] = v2[i] + (m[i][j]*v1[j]);
			}
		}
	}

	double t2 = omp_get_wtime() - t1;

	// Imprimo resultados
	if(n <= 15){
		printf("Tiempo: %f\n Tamaño: %i\n", t2, n);

		for(i=0; i<n; i++){
			printf("v[%i] = %f\n", i, v2[i]);
		}
	}
	else{
		printf("Tiempo: %f\n Tamaño: %i\n Primera componente: %f\n Última componente: %f\n", t2, n, v2[0], v2[n-1]);
	}

	#ifdef VECTOR_DYNAMIC
			// Liberamos memoria
			free(v1);
			free(v2);

			for(i=0; i<n; i++){
					free(m[i]);
			}

			free(m);
	#endif

	return 0;
}