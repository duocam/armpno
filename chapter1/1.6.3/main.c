#include <stdio.h>
#include <stdlib.h>
#define N 32768
int bubble_sort (int *data,int n);
//int bubble_sort_asm (int *data,int n);
#ifdef __cplusplus
	extern "C" {
		int bubble_sort_asm(int *data, int n);
	}
#endif

int main () {
	int i,*data1,*data2;
	data1 = (int *)malloc(N*sizeof (int));
	data2 = (int *)malloc(N*sizeof (int));
	srand(11);
	for (i=0;i<N;i++) data1[i]=data2[i]=rand();
	bubble_sort(data1,N);
	bubble_sort_asm(data2,N);
	for (i=0;i<N;i++){
		if (data1[i] != data2[i]) {
			fprintf(stderr,"mismatch on element %d\n",i);
			return 0;
		}
	}
	return 1;
}
