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

	/*if(longitud < 4096  || longitud > 32768) {
		fprintf(stderr,"introduzca un rango de valores ha de ser [4096, 32768]\n");
		exit(-1);
	}
	*/

	int i, j;
	double t1,t2;
	int contador;
	int * vector_original = (int *)malloc (sizeof(int)*longitud);
	int * vector_final = (int *)malloc (sizeof(int)*longitud);
	int **matriz =(int **)malloc(sizeof(int *) * longitud);


	
	contador= longitud;	
 	#pragma omp parallel num_threads(12) shared(matriz,vector_original,vector_final) private(i,j) 
 	{ 	
		#pragma omp single
			printf("Lo ejecutamos con %d hebras", omp_get_max_threads());

		//reservamos las filas de la matriz
		#pragma omp for schedule (runtime)
		for (i = 0; i < longitud; i++){
			matriz[i] = (int *)malloc((longitud-i)* sizeof(int));
		}	
			
	
		//inicializamos la matriz
		#pragma omp for schedule (runtime) 
		for (i=0; i<longitud; i++){
			for (j=0; j<longitud-i; j++){
				matriz[i][j]=i+1;
			}
		}

		//inicialziamos los vectores
		#pragma omp for schedule (runtime) 
		for(i=0; i<longitud; i++){
			vector_original[i] = i+1;
			vector_final[i] = 0;
		}

	}
	//captamos el primer tiempo
	t1 = omp_get_wtime();
	//multiplicamos
	contador = longitud; 
   #pragma omp parallel shared(matriz,vector_original,vector_final) private(i,j) 
   {	

		#pragma omp for schedule (runtime)
		for(i=0 ;i<longitud; i++){
			for(j=0; j<longitud-i; j++){
				vector_final[i] += matriz[i][j] * vector_original[j];
				//printf("vector_final[%d]+=%d*%d", i, matriz[i][j],vector_original[j]);
			}  
			
		}
	}

	t2= omp_get_wtime()-t1;

/*
	//Mostramos los resultados
	printf("\nMatriz triangular:\n\n");
	contador= longitud;	
		for(i=0; i<longitud; i++){
			for(j=0; j < contador-i; j++)
			{
				printf(" %d", matriz[i][j]);
			}

			for(j=contador-i; j < longitud; j++)
				printf(" 0");
			printf("\n");

		}

		printf("\nVector por el que multiplicamos:\n\n");
		for(i=0; i<longitud; i++) 
			printf(" %d",vector_original[i]);
	
		printf("\nVector resultante:\n\n");
		for(i=0; i<longitud; i++) 

*/	





		printf(" %d",vector_final[i]);	


		/*printf("Vector_resultante[0]:%d\n",vector_final[0]);
			printf("Vector_resultante[posicion_final]:%d\n",vector_final[longitud-1]);
		*/

	printf("\nTiempo para multiplicar: %9.9f\n",t2);

	//liberamos la memoria
	for(i=0; i<longitud; i++)
		free(matriz[i]);
	free(matriz);
	free(vector_final);
	free(vector_original);

}
