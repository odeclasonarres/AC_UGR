#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#define MAX 33554432
double v1[MAX],v2[MAX],v3[MAX];
int main(int argc, char ** argv){
  int a, b, c, d, i;
  double inicio, final;
  unsigned int N = atoi(argv[1]);
  if(N > MAX){
    N=MAX;
  }

  #pragma omp parallel
  {
    #pragma omp sections
    {
      #pragma omp section
      {
        for(a=0;a < (N/4);a++){
          v1[a] =N*0.1+a*0.1;
        }v2[a] = N*0.1-a*0.1;
      }
      #pragma omp section
      {
        for(b=(N/4);b <(N/4)*2;b++){
          v1[b] =N*0.1+b*0.1;
        }v2[b] = N*0.1-b*0.1;
      }
      #pragma omp section
      {
        for(c=(N/4)*2;c <(N/4)*3;c++){
          v1[c] =N*0.1+c*0.1;
        }
        v2[c] = N*0.1-c*0.1;
      }
      #pragma omp section
      {
        for(d=(N/4)*3;d < N;d++){
          v1[d] =N*0.1+d*0.1;
        }v2[d] = N*0.1-d*0.1;
      }
    }
    #pragma omp single
    {
      inicio = omp_get_wtime();
    }
    #pragma omp sections
    {
      #pragma omp section
      {
        for(a=0;a < (N/4);a++){
          v3[a] =v1[a] + v2[a];
        }
      }
      #pragma omp section
      {
        for(b=(N/4);b <(N/4)*2;b++){
          v3[b] =v1[b] + v2[b];
        }
      }
      #pragma omp section
      {
        for(c=(N/4)*2;c <(N/4)*3;c++){
          v3[c] =v1[c] + v2[c];
        }
      }
      #pragma omp section
      {
        for(d=(N/4)*3;d < N;d++){
          v3[d] =v1[d] + v2[d];
        }
      }
    }
    #pragma omp single
    {
      final = omp_get_wtime();
    }
  }
  if(N < 10){
    for(i=0; i<N; i++){
      printf("/ V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",i,i,i,v1[i],v2[i],v3[i]);
    }
  }else{
    printf("Tiempo(seg.):%f\t /Tamaño Vectores:%u\t/V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) / /V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f)/\n",final-inicio,N,v1[0],v2[0],v3[0],N-1,N-1,N-1,v1[N-1],v2[N-1],v3[N-1]);
  }
}
