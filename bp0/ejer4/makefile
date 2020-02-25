all: comp

comp: HelloOMP2.c
	gcc -O2 -fopenmp -o HelloOMP2 HelloOMP2.c

send:
	scp HelloOMP2 c3estudiante3@atcgrid.ugr.es:~/bp0/ejer4
	scp HelloOMP2.c c3estudiante3@atcgrid.ugr.es:~/bp0/ejer4
	scp script_helloomp.sh c3estudiante3@atcgrid.ugr.es:~/bp0/ejer4

clean:
	rm -r HelloOMP2