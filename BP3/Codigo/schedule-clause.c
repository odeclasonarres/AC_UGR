#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
#include <omp.h>
#else
#define omp_get_thread_num() 0
#endif
int main(int argc, char **argv) {
	int i, n=200,chunk,a[n],suma=0, m;
	omp_sched_t k;
	char *tipo;

	if(argc < 3) {
		fprintf(stderr,"\nFalta iteraciones o chunk \n");
		exit(-1);
	}
	n = atoi(argv[1]);
	if (n>200)
		n=200;
	chunk = atoi(argv[2]);
	for (i=0; i<n; i++)
		a[i] = i;
//***************************************************+
	omp_get_schedule (&k, &m);
	if(k==1){
		tipo="static";
	}
	else if(k==2){
		tipo="dynamic";
	}
	else if(k==3){
		tipo="guided";
	}
	else if(k==4){
		tipo="auto";
	}
	else{
		tipo="Error";
	}
	printf("\ndyn-var: %d\nnthreads-var: %d\nrun-ched-var: %s-%d\n\n", omp_get_dynamic(), omp_get_max_threads(),tipo, m);

//*********************************************************
	omp_set_dynamic(9);
	omp_set_num_threads(5);
	omp_set_schedule(omp_sched_guided,2);
//***********************************************************
	omp_get_schedule (&k, &m);
	if(k==1){
		tipo="static";
	}
	else if(k==2){
		tipo="dynamic";
	}
	else if(k==3){
		tipo="guided";
	}
	else if(k==4){
		tipo="auto";
	}
	else{
		tipo="Error";
	}
	printf("\ndyn-var: %d\nnthreads-var: %d\nrun-ched-var: %s-%d\n\n", omp_get_dynamic(), omp_get_max_threads(),tipo, m);
	#pragma omp parallel for firstprivate(suma) lastprivate(suma) schedule(dynamic,chunk)
	for (i=0; i<n; i++)
	{
		suma = suma + a[i];
		//printf(" thread %d suma a[%d]=%d suma=%d \n",
		//omp_get_thread_num(),i,a[i],suma);
	}
	printf("Fuera de 'parallel for' suma=%d\n",suma);
}
