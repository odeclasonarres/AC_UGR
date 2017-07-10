#include <stdio.h>
#include <stdlib.h>
#include <time.h>


void main(int argc,char **argv) {

	if(argc < 2) {
		fprintf(stderr,"falta el número de filas/columnas\n");
		exit(-1);
	}




	int N=atoi(argv[1]), i, j, k;
	struct timespec cgt1,cgt2;
	double ncgt;
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
	
	for(i=0; i<N; i++)
		for(j=0; j<N; j++)
			matriz[i][j] = 0;
	
	for(i=0; i<N; i++)
		for(j=0; j<N; j++)
			matriz1[i][j] = i+1;

	for(i=0; i<N; i++)
		for(j=0; j<N; j++)
			matriz2[i][j] = 1;//para facilitar la comprobacion


	//multiplicacion
	if(N%6 == 0){
		clock_gettime(CLOCK_REALTIME,&cgt1);
		for (i = 0; i < N; ++i) {
		      for (j = 0; j < N; ++j) {
		        for (k = 0; k < N; k= k +6) {
		           matriz[i][j] = matriz[i][j] + matriz1[i][k] * matriz2[k][j];
		           matriz[i][j] = matriz[i][j] + matriz1[i][k+1] * matriz2[k+1][j];
		           matriz[i][j] = matriz[i][j] + matriz1[i][k+2] * matriz2[k+2][j];
		           matriz[i][j] = matriz[i][j] + matriz1[i][k+3] * matriz2[k+3][j];
		           matriz[i][j] = matriz[i][j] + matriz1[i][k+4] * matriz2[k+4][j];
		           matriz[i][j] = matriz[i][j] + matriz1[i][k+5] * matriz2[k+5][j];
		        }
		      }
		}
		clock_gettime(CLOCK_REALTIME,&cgt2);
	}
	else if(N%5 == 0){
		clock_gettime(CLOCK_REALTIME,&cgt1);
		for (i = 0; i < N; ++i) {
		      for (j = 0; j < N; ++j) {
		        for (k = 0; k < N; k= k +5) {
		           matriz[i][j] = matriz[i][j] + matriz1[i][k] * matriz2[k][j];
		           matriz[i][j] = matriz[i][j] + matriz1[i][k+1] * matriz2[k+1][j];
		           matriz[i][j] = matriz[i][j] + matriz1[i][k+2] * matriz2[k+2][j];
		           matriz[i][j] = matriz[i][j] + matriz1[i][k+3] * matriz2[k+3][j];
		           matriz[i][j] = matriz[i][j] + matriz1[i][k+4] * matriz2[k+4][j];
		        //   matriz[i][j] = matriz[i][j] + matriz1[i][k+5] * matriz2[k+5][j];
		        }
		      }
		}
		clock_gettime(CLOCK_REALTIME,&cgt2);
	}
	else if(N%4 == 0){
		clock_gettime(CLOCK_REALTIME,&cgt1);
		for (i = 0; i < N; ++i) {
		      for (j = 0; j < N; ++j) {
		        for (k = 0; k < N; k= k +4) {
		           matriz[i][j] = matriz[i][j] + matriz1[i][k] * matriz2[k][j];
		           matriz[i][j] = matriz[i][j] + matriz1[i][k+1] * matriz2[k+1][j];
		           matriz[i][j] = matriz[i][j] + matriz1[i][k+2] * matriz2[k+2][j];
		           matriz[i][j] = matriz[i][j] + matriz1[i][k+3] * matriz2[k+3][j];
		         //  matriz[i][j] = matriz[i][j] + matriz1[i][k+4] * matriz2[k+4][j];
		        //   matriz[i][j] = matriz[i][j] + matriz1[i][k+5] * matriz2[k+5][j];
		        }
		      }
		}
		clock_gettime(CLOCK_REALTIME,&cgt2);
	}
	else if(N%3 == 0){
		clock_gettime(CLOCK_REALTIME,&cgt1);
		for (i = 0; i < N; ++i) {
		      for (j = 0; j < N; ++j) {
		        for (k = 0; k < N; k= k +3) {
		           matriz[i][j] = matriz[i][j] + matriz1[i][k] * matriz2[k][j];
		           matriz[i][j] = matriz[i][j] + matriz1[i][k+1] * matriz2[k+1][j];
		           matriz[i][j] = matriz[i][j] + matriz1[i][k+2] * matriz2[k+2][j];
		        //   matriz[i][j] = matriz[i][j] + matriz1[i][k+3] * matriz2[k+3][j];
		        //   matriz[i][j] = matriz[i][j] + matriz1[i][k+4] * matriz2[k+4][j];
		        //   matriz[i][j] = matriz[i][j] + matriz1[i][k+5] * matriz2[k+5][j];
		        }
		      }
		}
		clock_gettime(CLOCK_REALTIME,&cgt2);
	}
	else if(N%2 == 0){
		clock_gettime(CLOCK_REALTIME,&cgt1);
		for (i = 0; i < N; ++i) {
		      for (j = 0; j < N; ++j) {
		        for (k = 0; k < N; k= k +2) {
		           matriz[i][j] = matriz[i][j] + matriz1[i][k] * matriz2[k][j];
		           matriz[i][j] = matriz[i][j] + matriz1[i][k+1] * matriz2[k+1][j];
		        //   matriz[i][j] = matriz[i][j] + matriz1[i][k+2] * matriz2[k+2][j];
		        //   matriz[i][j] = matriz[i][j] + matriz1[i][k+3] * matriz2[k+3][j];
		        //   matriz[i][j] = matriz[i][j] + matriz1[i][k+4] * matriz2[k+4][j];
		        //   matriz[i][j] = matriz[i][j] + matriz1[i][k+5] * matriz2[k+5][j];
		        }
		      }
		}
		clock_gettime(CLOCK_REALTIME,&cgt2);
	}
	else{
		clock_gettime(CLOCK_REALTIME,&cgt1);
		for (i = 0; i < N; ++i) {
		      for (j = 0; j < N; ++j) {
		        for (k = 0; k < N; k++) {
		           matriz[i][j] = matriz[i][j] + matriz1[i][k] * matriz2[k][j];
		        //   matriz[i][j] = matriz[i][j] + matriz1[i][k+1] * matriz2[k+1][j];
		        //   matriz[i][j] = matriz[i][j] + matriz1[i][k+2] * matriz2[k+2][j];
		        //   matriz[i][j] = matriz[i][j] + matriz1[i][k+3] * matriz2[k+3][j];
		        //   matriz[i][j] = matriz[i][j] + matriz1[i][k+4] * matriz2[k+4][j];
		        //   matriz[i][j] = matriz[i][j] + matriz1[i][k+5] * matriz2[k+5][j];
		        }
		      }
		}
		clock_gettime(CLOCK_REALTIME,&cgt2);
	}
	







	printf("Ultimo valor de i para N=%d: %d\n\n", N, i-1);

	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	

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
	printf("\nTiempo en ejecutar matriz1xmatriz2:%8.6f\n",ncgt);
	
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


