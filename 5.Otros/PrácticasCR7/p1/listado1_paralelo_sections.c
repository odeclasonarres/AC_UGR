/* SumaVectoresC.c
Suma de dos vectores: v3 = v1 + v2
Para compilar usar (-lrt: real time library):
gcc -O2 SumaVectoresC.c -o SumaVectoresC -lrt
Para ejecutar use: SumaVectoresC longitud
*/
#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h> // biblioteca donde se encuentra la función printf()
#include <time.h> // biblioteca donde se encuentra la función clock_gettime()
#include <omp.h> // biblioteca con las funciones de OpenMP.



//#define printf_ALL // comentar para quitar el printf ...
// que imprime todos los componentes
//Sólo puede estar definida una de las tres constantes VECTOR_ (sólo uno de los ...
//tres defines siguientes puede estar descomentado):
//#define VECTOR_LOCAL // descomentar para que los vectores sean variables ...
// locales (si se supera el tamaño de la pila se ...
// generará el error "Violación de Segmento")
#define VECTOR_GLOBAL// descomentar para que los vectores sean variables ...
// globales (su longitud no estará limitada por el ...
// tamaño de la pila del programa)
//#define VECTOR_DYNAMIC // descomentar para que los vectores sean variables ...
// dinámicas (memoria reutilizable durante la ejecución)
#ifdef VECTOR_GLOBAL
#define MAX 33554432 //=2^25
double v1[MAX], v2[MAX], v3[MAX];
#endif
int main(int argc, char** argv){
int i;
double start, end, total;
//struct timespec cgt1,cgt2; double ncgt; //para tiempo de ejecución
//Leer argumento de entrada (no de componentes del vector)
if (argc<2){
printf("Faltan no componentes del vector\n");
exit(-1);
}
unsigned int N = atoi(argv[1]); // Máximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)
#ifdef VECTOR_LOCAL
double v1[N], v2[N], v3[N];
// Tamaño variable local en tiempo de ejecución ...
// disponible en C a partir de actualización C99
#endif
#ifdef VECTOR_GLOBAL
if (N>MAX) N=MAX;
#endif
#ifdef VECTOR_DYNAMIC
double *v1, *v2, *v3;
v1 = (double*) malloc(N*sizeof(double));// malloc necesita el tamaño en bytes
v2 = (double*) malloc(N*sizeof(double)); //si no hay espacio suficiente malloc devuelve NULL
v3 = (double*) malloc(N*sizeof(double));
if ( (v1==NULL) || (v2==NULL) || (v3==NULL) ){
printf("Error en la reserva de espacio para los vectores\n");
exit(-2);
}
#endif
//Inicializar vectores
#pragma omp parallel
{
	#pragma omp sections
	{

		#pragma omp section
		
		if(N > 1){	
			for(i=0; i<N/5; i++){
				v1[i] = N*0.1+i*0.1; v2[i] = N*0.1-i*0.1; 
			}
			printf("\nHebra %d ha inicializado los vectores v1 y v2 de la posición %d a la %d", omp_get_thread_num(), 0, N/5-1);
		}
		else{
			v1[0] = N*0.1+i*0.1; v2[0] = N*0.1-i*0.1;		
			printf("\nHebra %d ha inicializado la posición %d", omp_get_thread_num(), 1);
		}

		#pragma omp section
		if(N>2){
			for(i=N/5; i<(2*N)/5; i++){
				v1[i] = N*0.1+i*0.1; v2[i] = N*0.1-i*0.1; 
			}
			printf("\nHebra %d ha inicializado los vectores v1 y v2 de la posición %d a la %d", omp_get_thread_num(), N/5,(2*N)/5-1);
		}
		else if( N==2){
			v1[1] = N*0.1+i*0.1; v2[1] = N*0.1-i*0.1;	
			printf("\nHebra %d ha inicializado la posición %d", omp_get_thread_num(), 2);
		}
		#pragma omp section
		if(N>3){
			for(i=(2*N)/5; i<(3*N)/5; i++){
				v1[i] = N*0.1+i*0.1; v2[i] = N*0.1-i*0.1; 
			}
			printf("\nHebra %d ha inicializado los vectores v1 y v2 de la posición %d a la %d", omp_get_thread_num(), (2*N)/5,(3*N)/5-1);
		}
		else if (N==3){
			v1[2] = N*0.1+i*0.1; v2[2] = N*0.1-i*0.1;	
			printf("\nHebra %d ha inicializado la posición %d", omp_get_thread_num(), 3);
		}
		#pragma omp section
		if(N>4){
			for(i=(3*N)/5; i<(4*N)/5; i++){
				v1[i] = N*0.1+i*0.1; v2[i] = N*0.1-i*0.1; 
			}
			printf("\nHebra %d ha inicializado los vectores v1 y v2 de la posición %d a la %d", omp_get_thread_num(), (3*N)/5,(4*N)/5-1);
		}
		else if (N==4){
			v1[3] = N*0.1+i*0.1; v2[3] = N*0.1-i*0.1;	
			printf("\nHebra %d ha inicializado la posición %d", omp_get_thread_num(), 4)	;	
		}
		#pragma omp section
		if(N>5){
			for(i=(4*N)/5; i<(5*N)/5; i++){
				v1[i] = N*0.1+i*0.1; v2[i] = N*0.1-i*0.1; 
			}
			printf("\nHebra %d ha inicializado los vectores v1 y v2 de la posición %d a la %d", omp_get_thread_num(), (4*N)/5,(5*N)/5-1);
		}
		else if (N==5){
			v1[4] = N*0.1+i*0.1; v2[4] = N*0.1-i*0.1;	
			printf("\nHebra %d ha inicializado la posición %d", omp_get_thread_num(), 5);
		}	
		
	}
}

start=omp_get_wtime();

//Calcular suma de vectores
#pragma omp parallel
{
	#pragma omp sections
	{
		#pragma omp section
		
		if(N > 1){	
			for(i=0; i<N/5; i++){
				v3[i] = v1[i] + v2[i];
			}
			printf("\nHebra %d ha sumado de la posición %d a la %d", omp_get_thread_num(), 0, N/5-1);
		}
		else{
			v3[0] = v1[0] + v2[0];			
			printf("\nHebra %d ha sumado la posición %d", omp_get_thread_num(), 1);
		}

		#pragma omp section
		if(N>2){
			for(i=N/5; i<(2*N)/5; i++){
				v3[i] = v1[i] + v2[i];
			}
			printf("\nHebra %d ha sumado de la posición %d a la %d", omp_get_thread_num(), N/5,(2*N)/5-1);
		}
		else if( N==2){
			v3[1] = v1[1] + v2[1];				
			printf("\nHebra %d ha sumado la posición %d", omp_get_thread_num(), 2);
		}
		#pragma omp section
		if(N>3){
			for(i=(2*N)/5; i<(3*N)/5; i++){
				v3[i] = v1[i] + v2[i];
			}
			printf("\nHebra %d ha sumado de la posición %d a la %d", omp_get_thread_num(), (2*N)/5,(3*N)/5-1);
		}
		else if (N==3){
			v3[2] = v1[2] + v2[2];	
			printf("\nHebra %d ha sumado la posición %d", omp_get_thread_num(), 3);
		}
		#pragma omp section
		if(N>4){
			for(i=(3*N)/5; i<(4*N)/5; i++){
				v3[i] = v1[i] + v2[i];
			}
			printf("\nHebra %d ha sumado de la posición %d a la %d", omp_get_thread_num(), (3*N)/5,(4*N)/5-1);
		}
		else if (N==4){
			v3[3] = v1[3] + v2[3];	
			printf("\nHebra %d ha sumado la posición %d", omp_get_thread_num(), 4)	;	
		}
		#pragma omp section
		if(N>5){
			for(i=(4*N)/5; i<(5*N)/5; i++){
				v3[i] = v1[i] + v2[i];
			}
			printf("\nHebra %d ha sumado de la posición %d a la %d", omp_get_thread_num(), (4*N)/5,(5*N)/5-1);
		}
		else if (N==5){
			v3[4] = v1[4] + v2[4];
			printf("\nHebra %d ha sumado la posición %d", omp_get_thread_num(), 5);
		}	
		
	}
}
end=omp_get_wtime();


total= end-start;

//Imprimir resultado de la suma y el tiempo de ejecución
#ifdef PRINTF_ALL
printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\n",total,N);
for(i=0; i<N; i++)
printf("/ V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",i,i,i,v1[i],v2[i],v3[i]);
#else
printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\t/ V1[0]+V2[0]=V3[0 (%8.6f+%8.6f=%8.6f) / / V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n", total,N,v1[0],v2[0],v3[0],N-1,N-1,N-1,v1[N-1],v2[N-1],v3[N-1]);

printf("\n");
int w;
printf("V1		+	   V2		=	  V3\n");
for( w = 0; w < N; w++)
	printf("%f		%f		%f\n",v1[w],v2[w],v3[w]);

#endif
#ifdef VECTOR_DYNAMIC

free(v1); // libera el espacio reservado para v1
free(v2); // libera el espacio reservado para v2
free(v3); // libera el espacio reservado para v3
#endif

return 0;
}
