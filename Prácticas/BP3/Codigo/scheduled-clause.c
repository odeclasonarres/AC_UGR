#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
  #include <omp.h>
#else
   #define omp_get_thread_num() 0
#endif

int main(int argc, char **argv) {
  int i, n=200,chunk,a[n],suma=0;
  if(argc < 3){
    fprintf(stderr,"\nFalta iteraciones o chunk \n");
    exit(-1);
  }
  n = atoi(argv[1]); if (n>200) n=200; chunk = atoi(argv[2]);
  //printf("%s\n", omp_in_parallel());
  for (i=0; i<n; i++) a[i] = i;

  #pragma omp parallel for firstprivate(suma) \
            lastprivate(suma) schedule(dynamic,chunk)
   for (i=0; i<n; i++){
     suma = suma + a[i];
     printf(" thread %d suma a[%d]=%d suma=%d \n", omp_get_thread_num(),i,a[i],suma);
     printf("Dyn-var: %s\n", omp_get_dynamic());
     /*
     omp_set_dynamic()
     printf("nthreads-var: %s\n", omp_get_max_threads());
     omp_set_num_threads()
     printf("thread-limit-var: %s\n", omp_get_thread_limit() );
     printf("run-sched-var: %s\n",omp_get_schedule(&kind, &modifier) );
     omp_set_schedule(kind, modifier)
     printf("num_threads: %s\n",omp_get_num_threads());
     printf("num_procs: %s\n",omp_get_num_procs() );
     printf("in_parallel: %s\n", omp_in_parallel());*/
   }

   printf("Fuera de 'parallel for' suma=%d\n",suma);
   /*
   printf("Dyn-var: %s\n", omp_get_dynamic());
   omp_set_dynamic(1);
   printf("Dyn-var2: %s\n", omp_get_dynamic());
   printf("nthreads-var: %s\n", omp_get_max_threads());
   printf("thread-limit-var: %s\n", omp_get_thread_limit() );
   printf("un-sched-var: %s\n",omp_get_schedule(&kind, &modifier) );
   printf("num_threads: %s\n",omp_get_num_threads());
   printf("num_procs: %s\n",omp_get_num_procs() );
   printf("in_parallel: %s\n",omp_in_parallel());
   */return(0);
}
