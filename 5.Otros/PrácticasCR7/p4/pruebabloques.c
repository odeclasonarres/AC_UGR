

#include <stdio.h>
#include <stdlib.h>






int main(){

	int **A;	//4X4
	int **B;	//4X3
	int **C;	//4X3
	int i = 0;
	int j = 0;
	int N = 4;



	A = (int **)malloc (N*sizeof(int *));
	for(i=0; i<N; i++) 
		A[i] = (int *)malloc (N*sizeof(int));

	B = (int **)malloc (N*sizeof(int *));
	for(i=0; i<N; i++) 
		B[i] = (int *)malloc (N*sizeof(int));

	C = (int **)malloc (N*sizeof(int *));
	for(i=0; i<N; i++) 
		C[i] = (int *)malloc (N*sizeof(int));


	//INICIALIZAMOS:
	A[0][0]=1;A[0][1]=2;A[0][2]=3;A[0][3]=4;
	A[1][0]=5;A[1][1]=6;A[1][2]=7;A[1][3]=8;
	A[2][0]=9;A[2][1]=10;A[2][2]=11;A[2][3]=12;
	A[3][0]=13;A[3][1]=14;A[3][2]=15;A[3][3]=16;

	B[0][0]=1;B[0][1]=2;B[0][2]=3;B[0][3]=4;
	B[1][0]=5;B[1][1]=6;B[1][2]=7;B[1][3]=8;
	B[2][0]=9;B[2][1]=10;B[2][2]=11;B[2][3]=12;
	B[3][0]=13;B[3][1]=14;B[3][2]=15;B[3][3]=16;



	int jj, kk, k, temp, s = 5;

	printf("La matriz multiplicada por bloques:\n");
	for( jj=0;jj<N;jj+= s){
		    for( kk=0;kk<N;kk+= s){
		            for( i=0;i<N;i++){
		                    for( j = jj; j<((jj+s)>N?N:(jj+s)); j++){
		                            temp = 0;
		                            for( k = kk; k<((kk+s)>N?N:(kk+s)); k++){
		                                    temp += A[i][k]*B[k][j];
		                            }
		                            C[i][j] += temp;
		                    }
		            }
		    }
	}
	/*
	printf("La matriz multiplicada por normal:\n");
	for(i = 0; i < N; i++)
		for(j=0; j < N; j++)
			for(k=0; k < N; k++)
			C[i][j] = C[i][j] + A[i][k]*B[k][j];
	*/





	printf("\nMatriz A: \n");

	for(i=0; i < N; i++){
		for(j=0; j < N; j++)
			printf("  %d", A[i][j]);
		printf("\n\n");		
	}
	printf("\nMatriz B: \n");
	for(i=0; i < N; i++){
		for(j=0; j < N; j++)
			printf("  %d", B[i][j]);
		printf("\n\n");		
	}

	printf("\nMatriz C: \n");
	for(i=0; i < N; i++){
		for(j=0; j < N; j++)
			printf("  %d", C[i][j]);
		printf("\n\n");		
	}





	//libera memoria	
	for(i=0; i<N; i++)
	  free(A[i]);
	free(A);
	for(i=0; i<N; i++)
	  free(B[i]);
	free(B);
	for(i=0; i<N; i++)
	  free(C[i]);
	free(C);

}
