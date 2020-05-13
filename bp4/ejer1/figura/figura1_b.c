#include <stdio.h>
#include <stdlib.h>
#include <time.h>

struct {
	int a;
	int b;
} s[5000];

int main() {
	int i, ii;
	int X1, X2;
	int R[40000];
	clock_t t1, t2;
	double total;

	for(i=0; i<5000; i++){
		s[i].a = 1;
		s[i].b = 1;
	}

	t1 = clock();

	for (ii=0; ii<40000;ii++) {
		X1=0; X2=0; 

		for(i=0; i<5000;i+=5){	
			X1+=2*s[i].a+ii;
			X1+=2*s[i+1].a+ii;
			X1+=2*s[i+2].a+ii;
			X1+=2*s[i+3].a+ii;
			X1+=2*s[i+4].a+ii;
		}

		for(i=0; i<5000;i+=5){
			X2+=3*s[i].b-ii;
			X2+=3*s[i+1].b-ii;
			X2+=3*s[i+2].b-ii;
			X2+=3*s[i+3].b-ii;
			X2+=3*s[i+4].b-ii;
		}

		if (X1<X2) R[ii]=X1; else R[ii]=X2;
	}

	t2 = clock();
	total = (double)(t2-t1)/CLOCKS_PER_SEC;

	printf(" Tiempo: %f\n", total);
	printf("R[0] = %d\nR[39999] = %d\n", R[0], R[39999]);

	return 0;
}