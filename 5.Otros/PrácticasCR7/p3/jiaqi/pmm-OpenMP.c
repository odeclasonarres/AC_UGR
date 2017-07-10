#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
	#include <omp.h>
#else
	#define omp_get_thread_num() 0
#endif


void main(int argc,char **argv) {

	if(argc < 2) {
		fprintf(stderr,"falta el número de filas/columnas\n");
		exit(-1);
	}




	int N=atoi(argv[1]), i, j, k;
	double t1,t2;
	
	int **matriz;//matriz resultante
	int **matriz1;
	int **matriz2;
	//reservar memoria
	matriz = (int **)malloc (N*sizeof(int *));
	for(i=0; i<N; i++) 
		matriz[i] = (int *)malloc (N*sizeof(int));
	
	
	matriz1 = (int **)malloc (N*sizeof(int *));
	for(i=0; i<N; i++) 
		matriz1[i] = (int *)malloc (N*sizeof(int));
	
	
	matriz2 = (int **)malloc (N*sizeof(int *));
	for(i=0; i<N; i++) 
		matriz2[i] = (int *)malloc (N*sizeof(int));
	

	//inicializamos la matriz
	#pragma omp parallel shared(matriz1,matriz2,matriz) private(i,j)
	{
		  #pragma omp for schedule (runtime)
		for(i=0; i<N; i++)
			for(j=0; j<N; j++)
				matriz[i][j] = 0;
		#pragma omp for schedule (runtime)
		for(i=0; i<N; i++)
			for(j=0; j<N; j++)
				matriz1[i][j] = i+1;
		#pragma omp for schedule (runtime)
		for(i=0; i<N; i++)
			for(j=0; j<N; j++)
				matriz2[i][j] = 1;//para facilitar la comprobacion

	}
	//multiplicacion
	t1 = omp_get_wtime();
	#pragma omp parallel shared(matriz1,matriz2,matriz) private(i,j,k)
	{

	     	#pragma omp for schedule (runtime)
		for (i = 0; i < N; ++i) {
		  for (j = 0; j < N; ++j) {
		    for (k = 0; k < N; ++k) {
		       matriz[i][j] = matriz[i][j] + matriz1[i][k] * matriz2[k][j];
		    }
		  }
		}
	}
	t2 = omp_get_wtime();
	t2 = t2-t1;
	

	//mostrar resultado
	if(N<10){
		printf("matriz1:\n");
		for(i=0; i<N; i++){
			for(j=0; j<N; j++)
				printf("%d ",matriz1[i][j]);
			printf("\n");
		}
		printf("matriz2:\n");
		for(i=0; i<N; i++){
			for(j=0; j<N; j++)
				printf("%d ",matriz2[i][j]);
			printf("\n");
		}
		printf("\nResultado de multiplicación:\n");
		for(i=0; i<N; i++){
			for(j=0; j<N; j++)
				printf("%d ",matriz[i][j]);
			printf("\n");
		}
	}else{
		printf("matriz[0][0]:%d\n",matriz[0][0]);
		printf("matriz[N-1][N-1]:%d\n",matriz[N-1][N-1]);
	}
	printf("\nTiempo en ejecutar matriz1xmatriz2:%8.6f\n",t2);
	
	//libera memoria	
	for(i=0; i<N; i++)
	  free(matriz1[i]);
	free(matriz1);
	for(i=0; i<N; i++)
	  free(matriz2[i]);
	free(matriz2);
	for(i=0; i<N; i++)
	  free(matriz[i]);
	free(matriz);
}


