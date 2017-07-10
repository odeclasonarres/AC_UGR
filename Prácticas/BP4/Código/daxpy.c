#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define MAX 16000
#define BILLION  1000000000L;
int main(int argc, char **argv){
	if(argc < 3) {
		fprintf(stderr,"Sintaxis de ejecucion: ./daxpy <Tam_vector> <Constante_multiplicativa>\n");
	exit(-1);
	}
	struct timespec start, stop;
  	double accum;

	int tam_vector=atoi(argv[1]);
	int constante=atoi(argv[2]);
	int sumador[tam_vector];
	int multiplicador[tam_vector];

	int i;
	int j;
	int t;
	clock_gettime(CLOCK_REALTIME, &start);
	for(t=0;t<5000;t++){
		for(i=0;i<tam_vector;i++){
			sumador[i]=1;
			multiplicador[i]=1;
		}
		for(i=0;i<tam_vector;i++){
			sumador[i]=constante*multiplicador[i]+sumador[i];
		}
	}
	clock_gettime(CLOCK_REALTIME, &stop);
   	accum = ( stop.tv_sec - start.tv_sec ) + (double)( stop.tv_nsec - start.tv_nsec ) / (double)BILLION;
	printf("Tiempo (seg): %11.9f\n", accum);
}
