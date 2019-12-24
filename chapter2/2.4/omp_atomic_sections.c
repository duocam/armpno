#include <omp.h>
#include <stdio.h>

int main(){
	int a=0;
#pragma omp parallel num_threads(4)
	{
#pragma omp atomic
		a++;
	}
	printf("atomic %d\n",a); // printed value is always 4
	return 0;
}
