#include <stdio.h>
#include <stdlib.h>

#define N 32768

int data[N];

void init() {
	for (int i=0; i<N; i++) {
		data[i] = rand()%N;
	}
}

void print(const char* msg) {
	printf("%s\n", msg);

	for (int i=0; i<8; i++) {
		printf("%d\t", data[i]);
	}
	printf("\n");

	for (int j=0; j<2; ++j) {
		for (int i=0; i<8; i++) {
			printf(".\t");
		}
		printf("\n");
	}

	for (int i=N-8; i<N; i++) {
		printf("%d\t", data[i]);
	}
	printf("\n\n");
}

int main() {
	int i, j, temp;

	print("Before init");

	init();

	print("After init");

	for (i=0; i<(N-1); i++) 
		for (j=0; j<(N-1); j++) {
			if (data[j] > data[j+1]) {
				temp = data[j];
				data[j] = data[j+1];
				data[j+1] = temp;
			}
		}

	print("After sort");

	return 1;
}
