#include <omp.h>
#include <stdio.h>

int main(){
	int place = 0;
#pragma omp parallel
	{
#pragma omp critical (mycritsec)
		{
			place++;
			printf ("thread %d finished in position %d\n",
				omp_get_thread_num(),place);
		}
	}
	printf("critical_sections parallel region ended\n");
	return 0;
}
