#include <stdio.h>
#include <stdlib.h>
#include <time.h>

main(int argc,char **argv) {

	if(argc < 2) {
		fprintf(stderr,"falta el número de filas/columnas  \n");
		exit(-1);
	}
	

	int N=atoi(argv[1]), i, j;//filas/columnas de la matriz
	struct timespec cgt1,cgt2;
	double ncgt;
	int *Vector;
	Vector = (int *)malloc (sizeof(int)*N);
	int *Vector2;//es el vector resultado
	Vector2 = (int *)malloc (sizeof(int)*N);
	int **matriz;
	matriz = (int **)malloc(N * sizeof(int *)); 
	int col=N;
  	for (i = 0; i < N; ++i){
      		matriz[i] = (int *)malloc(col * sizeof(int)); 
      		col=col-1;
      	}
	

	//inicializando la matriz
	col=N;
      	//Inicializa la matriz
	for (i=0; i<N; i++){
	
		for (j=0; j<col; j++){
				
				matriz[i][j]=i+1;
				//printf("Valor%d\n",matriz[i][j]);
				
				
			
		}
		col--;
	}
	

	//inicializando el vector
	for(i=0; i<N; i++){
		Vector[i] = i+1;
		Vector2[i] = 0;
	}
	

	//tiempo
	clock_gettime(CLOCK_REALTIME,&cgt1);
	//multiplicacion
	for(i=0; i<N; i++){
		Vector2[i] = 0;
		for(j=0; j<N; j++){
		          Vector2[i] += matriz[i][j] * Vector[j];
		      
		}
	}
	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));


	//mostrar resultados
	if(N<10){
		printf("matriz:\n");
		for(i=0; i<N; i++){
			for(j=0; j<N; j++)
			{
				
					printf("%d ",matriz[i][j]);
			}
			printf("\n");
		}
		printf("\nVector:\n");
		for(i=0; i<N; i++) printf("%d ",Vector[i]);
		printf("\nResultado matriz x Vector:\n");
		for(i=0; i<N; i++) printf("%d ",Vector2[i]);
	}else{//si la matriz es demasiado grande
		printf("Vector2[0]:%d\n",Vector2[0]);
		printf("Vector2[N-1]:%d\n",Vector2[N-1]);
	}
	printf("\nTiempo en ejecutar matrizxVector:%8.6f\n",ncgt);
	

	//liberar memoria
	for(i=0; i<N; i++)
		free(matriz[i]);
	free(matriz);
	free(Vector);
	free(Vector2);
}


