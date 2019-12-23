#include <stdio.h>
#include <stdlib.h>
#define N 128*1024*1024

void cnts_tick(int *fd);
void cnts_tock(int *fd, unsigned long long cnts[][3]);
void cnts_dump(unsigned long long cnts[][3]);

int main(){

	float *d, *x; //*d_test;
	int i,j;
	int fd[5];
	unsigned long long cnts[4][3];
	float coeff[32] = {1.2,1.4,1.6,1.8,2.0,2.2,2.4,2.6};

	d = (float *)malloc(N);
	x = (float *)malloc(N);
	if (!d || !x){
		printf("malloc() error\n");
		return -1;
	}

	for (i=0;i<N/4;i++) x[i] = (float)rand()/(float)RAND_MAX;

	cnts_tick(fd);

	for (i=0;i<N/4;i++) { //(the outer loop)
		d[i] = coeff[0];
		for (j=1;j<8;j++) { //(the inner loop)
			d[i] *= x[i];
			d[i] += coeff[j];
		 }
	}
	cnts_tock(fd,cnts);
	cnts_dump(cnts);
	return 0;
}
