#include <time.h>
#include <stdio.h>


struct {
int a;
int b;
}s[5000];



main()
{
	struct timespec cgt1,cgt2; double ncgt;
	int ii, i, X1, X2;
	int R[40000];

	for(ii=0; ii < 5000; ii++){
		s[ii].a = ii+1;
		s[ii].b = ii+2;
	}
	
	//..
	clock_gettime(CLOCK_REALTIME,&cgt1);
	for (ii=1; ii<=40000;ii++) {

		X1=0; X2=0;
		for(i=0; i<5000;i++){ X1+=2*s[i].a+ii; X2+=3*s[i].b-ii; /*_mm_prefetch(s[ii+10],_MM_HINT_T0);*/}
			if (X1<X2)
				R[ii]=X1;
			else
				R[ii]=X2;


	}
	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+ (double) ((cgt2.tv_nsec-	cgt1.tv_nsec)/(1.e+9));

	printf("Tiempo(seg.):%11.9f\t\n",ncgt);


	//..
}
