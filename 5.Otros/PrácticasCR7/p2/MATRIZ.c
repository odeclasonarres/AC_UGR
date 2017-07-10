#include <stdio.h>
#include <time.h> 
#include <stdlib.h>
#ifdef _OPENMP
#include <omp.h>
#else
#define omp_get_thread_num() 0
#endif

int main(int argc, char **argv){

struct timespec cgt1,cgt2;

	if(argc < 2) {
		fprintf(stderr,"Faltan componentes\n");
		exit(-1);
	}

	const int N = atoi(argv[1]);

	int matriz[N][N];
	int v3[N];
	int vfinal[N];

	int i, j;

	for(i=0; i < N; i++)
		for(j=0; j <N; j++)		
			matriz[i][j]=(i + j)%10;
	
	for(i=0; i < N; i++)
		v3[i]=i%10;	

	for(i=0; i < N; i++)
		vfinal[i]=0;	

clock_gettime(CLOCK_REALTIME,&cgt1);

	for(i=0; i < N; i++)
		for(j=0; j <N; j++)	
			vfinal[i]= vfinal[i]+ matriz[i][j] * v3[j];

clock_gettime(CLOCK_REALTIME,&cgt2);

	printf("Matriz inicial: \n");
	for(i=0; i < N; i++){
		for(j=0; j <N; j++)		
			printf("  %d", matriz[i][j]);	
		printf("\n\n");	
	}	

	printf("Vector inicial: \n");
	for(i=0; i < N; i++)
		printf(" %d\n", v3[i]);

	printf("Vector final: \n");
	for(i=0; i < N; i++)
		printf(" %d\n", vfinal[i]);



double ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+
(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));


printf("\n\nEl tiempo de ejecución de la multiplicación es: %f\n\n\n", ncgt);

}

