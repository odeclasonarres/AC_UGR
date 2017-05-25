#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#define MAX 32768
#define MIN 4096
int main(int argc, char *argv[]){

	if(argc != 3){
		printf("Numero de parametros incorrecto: tama\n");
		exit(-1);
	}
	int i, j, k, **matrizA, **matrizB, **matrizSol, res;
	int sum;
	int filas = atoi(argv[1]);
	int max_hebras = atoi(argv[2]);
	double inicio, final;
	//inicializacion de las 3 matrices;
	matrizA = (int**) malloc(filas*sizeof(int*));
	matrizB = (int**) malloc(filas*sizeof(int*));
	matrizSol = (int**) malloc(filas*sizeof(int*));
	for(i=0; i < filas; i++){
		matrizA[i] = (int*) malloc(filas*sizeof(int));
		matrizB[i] = (int*) malloc(filas*sizeof(int));
		matrizSol[i] = (int*) malloc(filas*sizeof(int));
	}
	omp_set_num_threads(max_hebras);
	inicio = omp_get_wtime();
	#pragma omp pararell for private(j)
	for(i=0;i<filas;i++){
		for(j=0;j<filas;j++){
			matrizA[i][j] = 1;
			matrizB[i][j] = j;
			matrizSol[i][j] = 0;
		}
	}
	//multiplicacion
	for (i=0;i<filas;i++){
		for (j=0;j<filas;j++){
			sum = 0;
			#pragma omp parallel for reduction(+:sum) //private(i,j)
		    for (k=0;k<filas;k++){
				sum+=matrizA[i][k]*matrizB[k][j];
			}
			matrizSol[i][j] = sum;
		}
	}
	final = omp_get_wtime();

	printf("%f\n",final-inicio);
}
