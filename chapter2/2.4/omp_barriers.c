#include <omp.h>
#include <stdio.h>

int main(){
	int a;
#pragma omp parallel num_threads(4)
	{
		if (omp_get_thread_num()!=2) a=omp_get_thread_num();
#pragma omp barrier
		if (omp_get_thread_num()==2) a=omp_get_thread_num();
	}
	printf("barriers %d\n",a); // printed value is always 2
	return 0;
}
