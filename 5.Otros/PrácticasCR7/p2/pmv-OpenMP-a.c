#include <stdio.h>
#include <time.h> 
#include <stdlib.h>
#ifdef _OPENMP
#include <omp.h>
#else
#define omp_get_thread_num() 0
#endif

int main(int argc, char **argv){
double t1, t2, tfinal;

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


t1=omp_get_wtime();

#pragma omp parallel private(j)
{
	#pragma omp for

	for (i=0;i<N;i++) {
		for (j=0;j<N;j++) 
		{
				vfinal[i]= vfinal[i]+ matriz[i][j] * v3[j];
		}
	}
}

t2=omp_get_wtime();

tfinal= t2-t1;



/*
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
*/

		printf(" %d\n", vfinal[0]);
		printf(" %d\n", vfinal[N-1]);

printf("\n\nEl tiempo de ejecución de la multiplicación es: %f\n\n\n", tfinal);

}

