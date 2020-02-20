all: comp

comp: HelloOMP.c
	gcc -O2 -fopenmp -o HelloOMP HelloOMP.c

send:
	scp HelloOMP c3estudiante3@atcgrid.ugr.es:~/bp0

clean:
	rm -r HelloOMP