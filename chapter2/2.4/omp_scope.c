#include <omp.h>
#include <stdio.h>

void num_thread(){
	int a=1;
#pragma omp parallel num_threads(4)
	{
		a=2;
	}
	printf("number_therad %d\n",a); // value printed is 2
}

void private_var(){
	int a=1;
#pragma omp parallel num_threads(4) private(a)
	{
		a=2; // a will be destroyed
	}
	printf("private(a) %d\n",a); // printed value is 1
	return;
}


void frist_private(){
	int a=1;
#pragma omp parallel num_threads(4) firstprivate(a)
	{
		a += omp_get_thread_num(); // initial value of a51
		printf("fristprivate %d\n",a);
	}
	return;
}

void thread_private(){
	static int a = 1; // threadprivate variables must be global
#pragma omp threadprivate(a) //threadprivate() mustbe used as a standalone OMP directive
#pragma omp parallel num_threads(4) // first parallel region sets four separate “versions” oof a variable
	{
		a=omp_get_thread_num();
	}
#pragma omp parallel num_threads(4) // second parallel region recalls the four “versions”" of a avariable
	{
		printf ("thread_private %d\n",a);
	}
	return;
}

void copy_in(){
	static int a=1;
#pragma omp threadprivate(a)
#pragma omp parallel num_threads(4) copyin(a)
	{
		a += omp_get_thread_num(); // initial value of a51
	}
	printf("copy in %d\n",a);
	return;
}

void reduction(){
	int a;
#pragma omp parallel num_threads(4) reduction(+:a)
	{
		a = omp_get_thread_num();
	}
	printf(" reduction %d\n",a); // printed value is 0+1+2+356
	return;
}

void last_private(){
	int a,i;
#pragma omp parallel for num_threads(4) lastprivate(a)
	for (i=0;i<16;i++) {

		a=omp_get_thread_num();
	}
	printf("last private %d\n",a); // printed value is 3, since iteration 15 is
	// performed in thread 3
	return;
}

void first_last_default(){
	int a=10,b=1,c=5;
#pragma omp parallel sections firstprivate(a) lastprivate(b) default(none)
	{

#pragma omp section
		b=0+a;
#pragma omp section
		b=1+a;
#pragma omp section
		b=2+a;
	}
#pragma omp parallel num_threads(4) reduction(+:c)
	c=omp_get_thread_num();
	printf("a=%d, b=%d, c=%d\n",a,b,c); // a=10, b=12, c=11
	return;
}

int main(){
	num_thread();
	private_var();
	frist_private();
	thread_private();
	copy_in();
	reduction();
	last_private();
	first_last_default();
	return 0;
}
