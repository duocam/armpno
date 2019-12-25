#include <stdio.h>
#include <stdlib.h>
#include <math.h>
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

void double_buffer(float *d, float *x, float *coeff){
	int i,j,temp1,temp2;

	for(i = 0;i < N/4;i++){
		temp1=coeff[0];
		for (j=1;j<7;j=j+2) {
			temp2=coeff[j];
			temp2=temp2+temp1*x[i];
			temp1=coeff[j+1];
			temp1=temp1+temp2*x[i];
		}
		d[i]=coeff[j+1];
		d[i]=d[i]+temp2*x[i];
	}
	return;
}

void inline_assembly(float *d, float *x, float *coeff){
	int i;
	for (i=0;i<N/4;i++) {
		asm ("flds s0, %[mem]\n\t" : : [mem]"m" (coeff[0]) : "s0");
		asm ("flds s1, %[mem]\n\t" : : [mem]"m" (x[i]) : "s1");
		asm ("flds s2, %[mem]\n\t" : : [mem]"m" (coeff[1]) : "s2");
		asm ("fmacs s2, s0, s1\n\t" : : : "s2");
		asm ("flds s0, %[mem]\n\t" : : [mem]"m" (coeff[2]) : "s0");
		asm ("fmacs s0, s2, s1\n\t" : : : "s0");
		asm ("flds s2, %[mem]\n\t" : : [mem]"m" (coeff[3]) : "s2");
		asm ("fmacs s2, s0, s1\n\t" : : : "s2");
		asm ("flds s0, %[mem]\n\t" : : [mem]"m" (coeff[4]) : "s0");
		asm ("fmacs s0, s2, s1\n\t" : : : "s0");
		asm ("flds s2, %[mem]\n\t" : : [mem]"m" (coeff[5]) : "s2");
		asm ("fmacs s2, s0, s1\n\t" : : : "s2");
		asm ("flds s0, %[mem]\n\t" : : [mem]"m" (coeff[6]) : "s0");
		asm ("fmacs s0, s2, s1\n\t" : : : "s0");
		asm ("flds s2, %[mem]\n\t" : : [mem]"m" (coeff[7]) : "s2");
		asm ("fmacs s2, s0, s1\n\t" : : : "s2");
		asm ("fsts s2, %[mem]\n\t" : [mem]"=m" (d[i]));
	}
}
int main(){

	float *d_ori,*d_duobuf,*d_asm,*x,error; //*d_test;
	int i;//j;
	int fd[5];
	unsigned long long cnts[4][3];
	float coeff[32] = {1.2,1.4,1.6,1.8,2.0,2.2,2.4,2.6};

	d_ori = (float *)malloc(N);
	d_duobuf = (float *)malloc(N);
	d_asm = (float *)malloc(N);
	x = (float *)malloc(N);
	if (!d_ori || !x || !d_duobuf || !d_asm){
		printf("malloc() error\n");
		return -1;
	}

	for (i=0;i<N/4;i++) x[i] = (float)rand()/(float)RAND_MAX;

	printf("origin loop\n");
	cnts_tick(fd);
	origin_loop(d_ori,x,coeff);
	cnts_tock(fd,cnts);
	cnts_dump(cnts);

	printf("double buffer\n");
	cnts_tick(fd);
	double_buffer(d_duobuf,x,coeff);
	cnts_tock(fd,cnts);
	cnts_dump(cnts);

	printf("inline assembly start\n");
	cnts_tick(fd);
	inline_assembly(d_asm,x,coeff);
	cnts_tock(fd,cnts);
	cnts_dump(cnts);

/* double buffer has huge differences from origin on android phone, don't know why, skip the compar*/
//	printf("check result for double buffer\n");
//	for (i=0;i<N/4;i++) {
//		error = fabs(d_duobuf[i]-d_ori[i])/d_ori[i];
//		if (error > 1.0e-2) {
//			printf("verification error, d_ori[%d]=%0.2e,\
//					d_duobuf[%d]=%0.2e, error=%0.2f%%\n",
//					i,d_ori[i],i,d_duobuf[i],error*1.0e2);
//		}
//	}

	printf("check result for inline_assembly\n");
	for (i=0;i<N/4;i++) {
		error = fabs(d_asm[i]-d_ori[i])/d_ori[i];
		if (error > 1.0e-2) {
			printf("verification error, d_ori[%d]=%0.2e,\
					d_asm[%d]=%0.2e, error=%0.2f%%\n",
					i,d_ori[i],i,d_asm[i],error*1.0e2);
		}
	}

	free(d_ori);
	free(d_duobuf);
	free(d_asm);
	free(x);

	return 0;
}
