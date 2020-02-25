all: comp

comp: SumaVectores.c
	gcc -O2 SumaVectores.c -o SumaVectores -lrt

send:
	scp SumaVectores c3estudiante3@atcgrid.ugr.es:~/bp0/ejer7
	scp SumaVectores.c c3estudiante3@atcgrid.ugr.es:~/bp0/ejer7
	scp script.sh c3estudiante3@atcgrid.ugr.es:~/bp0/ejer7

clean:
	rm -r SumaVectores