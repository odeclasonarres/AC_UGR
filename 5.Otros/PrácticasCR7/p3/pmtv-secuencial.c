#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#ifdef _OPENMP
#include <omp.h>
#else
#define omp_get_thread_num() 0
#endif

main(int argc,char **argv) {

	if(argc < 2) {
		fprintf(stderr,"falta el número de columnas y filas (es el mismo)\n");
		exit(-1);
	}
	
	int longitud=atoi(argv[1]);
	int i, j;
	struct timespec cgt1,cgt2;
	double ncgt;
	double t1,t2;
	int contador;
	int * vector_original = (int *)malloc (sizeof(int)*longitud);
	int * vector_final = (int *)malloc (sizeof(int)*longitud);
	int **matriz =(int **)malloc(sizeof(int *) * longitud);
	
	//reservamos las filas de la matriz
	for (i = 0, contador= longitud; i < longitud; i++, contador--){
		matriz[i] = (int *)malloc(contador * sizeof(int));
		
	}
		
	//inicialziamos los vectores
	for(i=0; i<longitud; i++){
		vector_original[i] = i+1;
		vector_final[i] = 0;
	}

	//inicializamos la matriz
	for (i=0, contador=longitud; i<longitud; i++){
		for (j=0; j<contador; j++){
			matriz[i][j]=i+1;
		}
		contador--;
	}
	//captamos el primer tiempo
	clock_gettime(CLOCK_REALTIME,&cgt1);
	//multiplicamos
	for(i=0, contador = longitud; i<longitud; i++){
		for(j=0; j<contador; j++){
			vector_final[i] += matriz[i][j] * vector_original[j];
			//printf("vector_final[%d]+=%d*%d", i, matriz[i][j],vector_original[j]);
		}
		contador--;
	}

	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));


	//Mostramos los resultados
/*	printf("\nMatriz triangular:\n\n");
		for(i=0, contador=longitud; i<longitud; i++){
			for(j=0; j < contador; j++)
			{
				printf(" %d", matriz[i][j]);
			}

			for(j=contador; j < longitud; j++)
				printf(" 0");
			printf("\n");
			contador--;
		}

		printf("\nVector por el que multiplicamos:\n\n");
		for(i=0; i<longitud; i++) 
			printf(" %d",vector_original[i]);
	
		printf("\nVector resultante:\n\n");
		for(i=0; i<longitud; i++) 
	





		printf(" %d",vector_final[i]);	
*/

		printf("Vector_resultante[0]:%d\n",vector_final[0]);
		printf("Vector_resultante[posicion_final]:%d\n",vector_final[longitud-1]);
	

	printf("\nTiempo para multiplicar: %9.9f\n",ncgt);

	//liberamos la memoria
	for(i=0; i<longitud; i++)
		free(matriz[i]);
	free(matriz);
	free(vector_final);
	free(vector_original);

}
