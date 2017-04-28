#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <omp.h>
#define BILLION 1000000000L
#define MAX 16000
double M[MAX][MAX], v1[MAX], v2[MAX];
int main(int argc, char **argv){
	struct timespec inicio, final;
	double total;
	int N;
	int i, k;
	if(argc < 2) {
		fprintf(stderr,"Parametro: Tama matriz\n");
		exit(-1);
	}
	N = atoi(argv[1]);
	if (N>MAX)
		N=MAX;

	clock_gettime(CLOCK_REALTIME, &inicio);
	#pragma omp parallel for
	for(i = 0; i < N; i++){
		v1[i] = i;
		v2[i] = 0;
		#pragma omp parallel for
		for(k = 0; k < N; k++)
			M[i][k] = k + N*i;
		}
	#pragma omp parallel private(i)
	for(i = 0; i < N; i++)
		#pragma omp for
		for(k = 0; k < N; k++)
			v2[i] += M[i][k] * v1[k];

	clock_gettime(CLOCK_REALTIME, &final);
	total = ( final.tv_sec - inicio.tv_sec ) + (double)
	( final.tv_nsec - inicio.tv_nsec ) / (double)BILLION;
	printf("Tiempo (seg): %11.9f\t", total);
	printf("v2[0] = %8.6f / ", v2[0]);
	printf("v2[%d] = %8.6f \n\n", N-1, v2[N-1]);
}
