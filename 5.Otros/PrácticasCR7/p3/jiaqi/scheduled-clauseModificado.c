#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
 #include <omp.h>
#else
 #define omp_get_thread_num() 0
#endif

void main(int argc,char **argv){
 int i,n=200,chunk,a[n],suma=0;
 if(argc<3){
  fprintf(stderr,"\nFalta numero de interaciones o chunk \n");
  exit(-1);
 }
 n=atoi(argv[1]); if(n>200) n=200; chunk = atoi(argv[2]);
 for(i=0; i<n; i++)  a[i] = i;
 #pragma omp parallel 
 {  
    #pragma omp for firstprivate(suma) lastprivate(suma) schedule(dynamic,chunk)
    for(i=0; i<n; i++){
      suma = suma + a[i];
      printf(" thread %d suma a[%d]=%d suma=%d \n",omp_get_thread_num(),i,a[i],suma);
    }
    #pragma omp sections
    {
  #pragma omp section
  printf("Dentro de parallel dyn-var:%d \n",omp_get_dynamic());
  #pragma omp section
  printf("Dentro de parallel nthreads-var:%d \n",omp_get_max_threads());
#pragma omp section
  printf("Dentro de parallel thread-limit-var:%d \n",omp_get_thread_limit());
/*#pragma omp section
  printf("Dentro de parallel run-sched-var:%d \n",omp_get_schedule(&kind, &modifier));
  }*/
 }
}
  printf("Fuera de parallel for suma = %d \n",suma);
  printf("Fuera de parallel dyn-var:%d \n",omp_get_dynamic());
  printf("Fuera de parallel nthreads-var:%d \n",omp_get_max_threads());
  printf("Fuera de parallel thread-limit-var:%d \n",omp_get_thread_limit());
//  printf("Fuera de parallel run-sched-var:%d \n",omp_get_schedule(&kind, &modifier));
}



