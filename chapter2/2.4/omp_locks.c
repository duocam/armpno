#include <omp.h>
#include <stdio.h>

int main(){
	int a=0;
	omp_lock_t mylock;
	omp_init_lock(&mylock);
#pragma omp parallel num_threads(4)
	{
		omp_set_lock(&mylock);
		a++;
		omp_unset_lock(&mylock);
	}
	printf("locks %d\n",a); // printed value is always 4
	return 0;
}
