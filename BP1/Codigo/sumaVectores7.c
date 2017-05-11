#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#define MAX 33554432
double v1[MAX],v2[MAX],v3[MAX];
int main(int argc, char ** argv){
  int i;
  double inicio, final;
  unsigned int N = atoi(argv[1]);
  if(N > MAX){
    N=MAX;
  }
  #pragma omp parallel
  {
    #pragma omp for
      for(i=0; i<N; i++){
        v1[i] = N*0.1+i*0.1;
      }
      v2[i] = N*0.1-i*0.1;
    #pragma omp single
    {
      inicio = omp_get_wtime();
    }
    #pragma omp for
      for(i=0;i< N;i++){
        v3[i] = v1[i] + v2[i];
      }
    #pragma omp single
    {
      final = omp_get_wtime();
    }
  }
  printf("Tiempo(seg.):%f\t /Tamaño Vectores:%u\t/V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) / / V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f)/\n",final-inicio,N,v1[0],v2[0],v3[0],N-1,N-1,N-1,v1[N-1],v2[N-1],v3[N-1]);
}
