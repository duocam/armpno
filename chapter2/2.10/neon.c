#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <omp.h>
#include <arm_neon.h>
#define N 128*1024*1024

void cnts_tick(int *fd);
void cnts_tock(int *fd, unsigned long long cnts[][3]);
void cnts_dump(unsigned long long cnts[][3]);

void origin_loop(float *d, float *x, float *coeff){
	int i,j;
	for (i=0;i<N/4;i++) { //(the outer loop)
		d[i] = coeff[0];
		for (j=1;j<8;j++) { //(the inner loop)
			d[i] *= x[i];
			d[i] += coeff[j];
		 }
	}
	return;
}
void neon_loop(float *d, float *x, float *coeff_4vector){
		float32x4_t x0,a,b;
		int i;
#pragma omp parallel for private(x0,a,b)
{
	for (i=0;i<N/4;i+=4) {
		x0 = vld1q_f32((float32_t *)&x[i]);
		a = vld1q_f32((float32_t *)&coeff_4vector[0]);
		b = vld1q_f32((float32_t *)&coeff_4vector[4]);
		b=vmlaq_f32 (b,a,x0);
		a=vld1q_f32((float32_t *)&coeff_4vector[8]);
		a=vmlaq_f32 (a,b,x0);
		b=vld1q_f32((float32_t *)&coeff_4vector[12]);
		b=vmlaq_f32 (b,a,x0);
		a=vld1q_f32((float32_t *)&coeff_4vector[16]);
		a=vmlaq_f32 (a,b,x0);
		b=vld1q_f32((float32_t *)&coeff_4vector[20]);
		b=vmlaq_f32 (b,a,x0);
		a=vld1q_f32((float32_t *)&coeff_4vector[24]);
		a=vmlaq_f32 (a,b,x0);
		b=vld1q_f32((float32_t *)&coeff_4vector[28]);
		b=vmlaq_f32 (b,a,x0);
		vst1q_f32((float32_t *)&d[i],b);
	}
}
	return;
}

int main(){

	float *d,*d_neon,*x,error; //*d_test;
	int i;//j;
	int fd[5];
	unsigned long long cnts[4][3];
	float coeff[32] = {1.2,1.4,1.6,1.8,2.0,2.2,2.4,2.6};
	float __attribute__((aligned(16))) coeff_4vector[32] =
	{1.2,1.2,1.2,1.2,
	1.4,1.4,1.4,1.4,
	1.6,1.6,1.6,1.6,
	1.8,1.8,1.8,1.8,
	2.0,2.0,2.0,2.0,
	2.2,2.2,2.2,2.2,
	2.4,2.4,2.4,2.4,
	2.6,2.6,2.6,2.6};

	d = (float *)malloc(N);
	d_neon = (float *)malloc(N);
	x = (float *)malloc(N);
	//x_neon = (float *)malloc(N+16);
	if (!d || !x || !d_neon){
		printf("malloc() error\n");
		return -1;
	}

	for (i=0;i<N/4;i++) x[i] = (float)rand()/(float)RAND_MAX;
	//for (i=0;i<N/4;i++) x_neon[i] = (float)rand()/(float)RAND_MAX;

	printf("origin loop\n");
	cnts_tick(fd);
	origin_loop(d,x,coeff);
	cnts_tock(fd,cnts);
	cnts_dump(cnts);

	printf("inline assembly start\n");
	//d_neon =(float *)(((unsigned int)d & 0xF) + 16);
	//x_neon =(float *)(((unsigned int)x & 0xF) + 16);
	cnts_tick(fd);
	neon_loop(d_neon,x,coeff_4vector);
	cnts_tock(fd,cnts);
	cnts_dump(cnts);

	printf("check result for inline_assembly\n");
	for (i=0;i<N/4;i++) {
		error = fabs(d_neon[i]-d[i])/d[i];
		if (error > 1.0e-2) {
			printf("verification error, d[%d]=%0.2e,\
					d_neon[%d]=%0.2e, error=%0.2f%%\n",
					i,d[i],i,d_neon[i],error*1.0e2);
		}
	}

	free(d);
	free(d_neon);
	free(x);
	//free(x_neon);

	return 0;
}
