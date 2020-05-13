#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char **argv){
	int i;
	clock_t t1, t2;
	double total;

	if(argc < 2){
		fprintf(stderr,"Falta tamaño de la matriz (debe de ser cuadrada)\n");
		exit(-1);
	}

	unsigned int N = atoi(argv[1]);
	double y[N], x[N];

	int a = 2;
	for(i=0; i<N; i++){
		y[i] = 1;
		x[i] = 3;
	}

	t1 = clock();

	for (i=0;i<N;i++) y[i] = a*x[i] + y[i];

	t2 = clock();
	total = (double)(t2-t1)/CLOCKS_PER_SEC;

	printf(" Tiempo: %f\n", total);
	printf("y[0] = %f\ny[N-1] = %f\n", y[0], y[N-1]);
}