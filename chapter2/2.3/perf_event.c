#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/time.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <asm/unistd.h>
#include <linux/perf_event.h>
#include <err.h>

#define CYCLES 0
#define INSTRUCTIONS 1
#define CACHEREFS 2
#define CACHEMISSES 3

#define NUM_OF_FD 4
#define CLOCK_RATE  1989.0e6
#define N 128*1024*1024  

long perf_event_open(struct perf_event_attr *hw_event,
		pid_t pid,
		int cpu,
		int group_fd,
		unsigned long flags) {
	int ret;
	ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);

	return ret;
}

static inline unsigned long long perf_count(unsigned long long *values) {
	return (unsigned long long)((float)values[0] * (float)values[1]/(float)values[2]);
}

void cnts_close(int *fd) {
	int i;
	for(i=0; i<NUM_OF_FD; i++) close(fd[i]);
}

int cnts_open(int *fd) {
	struct perf_event_attr attr;
	//printf("size of attr:%d\n", sizeof(attr));
	memset(&attr, 0, sizeof(attr));

	attr.type = PERF_TYPE_HARDWARE;
	attr.size = sizeof(struct perf_event_attr);
	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED|
		PERF_FORMAT_TOTAL_TIME_RUNNING;

	attr.config = PERF_COUNT_HW_CPU_CYCLES;
	fd[CYCLES] = perf_event_open(&attr, 0, -1, -1, 0);
	if (fd[CYCLES] == -1) {
		perror("cannot open perf_counter for cycles");
		exit(0);
	}

	attr.config = PERF_COUNT_HW_INSTRUCTIONS;
	fd[INSTRUCTIONS] = perf_event_open(&attr, 0, -1, -1, 0);
	if (fd[INSTRUCTIONS] == -1) {
		perror("cannot open perf_counter for instructions");
		exit(0);
	}

	attr.config = PERF_COUNT_HW_CACHE_REFERENCES;
	fd[CACHEREFS] = perf_event_open(&attr, 0, -1, -1, 0);
	if (fd[CACHEREFS] == -1) {
		perror("cannot open perf_counter for cacherefs");
		exit(0);
	}

	attr.config = PERF_COUNT_HW_CACHE_MISSES;
	fd[CACHEMISSES] = perf_event_open(&attr, 0, -1, -1, 0);
	if (fd[CACHEMISSES] == -1) {
		perror("cannot open perf_counter for cachemisses");
		exit(0);
	}
}

void cnts_tick(int *fd) {
	int i, ret; 

	cnts_open(fd);

	for (i=0; i<NUM_OF_FD; i++) {
		ret = ioctl(fd[i], PERF_EVENT_IOC_RESET);
		if (ret == -1)
			err(-1, "ioctl() in cnts_tick() failed");
	}
}

void cnts_tock(int *fd, unsigned long long cnts[][3]) {
	int i, ret;
	for(i=0; i<NUM_OF_FD; i++) {
		ret = read(fd[i], cnts[i], sizeof(cnts[i]));
		if (ret != 24) 
			err(-1, "ioctl() in cnts_tock() failed");
	}

	cnts_close(fd);
}

void cnts_dump(unsigned long long cnts[][3]) {
	float time, membw;

	time = ((float)perf_count(cnts[CYCLES]))/CLOCK_RATE;
	membw = (float)N*2/time/(1024.0f*1024.0f);

	float flops, mflops, ipf;
	flops = (float)N/4.0*14;	// 14 ops per output value
	mflops = flops/time/1.0e6;
	ipf = (float)(perf_count(cnts[INSTRUCTIONS]))/flops;

	printf("[perf_event] cycles = %'llu (%0.0f us)\n",
			perf_count(cnts[CYCLES]),
			((float)perf_count(cnts[CYCLES]))/((float)CLOCK_RATE/1.0E6));

	printf("[perf_evcent] membw = %'0.2f MB/s\n", membw);

	printf("[perf_event] instructions = %'llu(CPI=%0.2f)\n",
			perf_count(cnts[INSTRUCTIONS]),
			(float)(perf_count(cnts[CYCLES]))/
			(float)(perf_count(cnts[INSTRUCTIONS])));

	printf("[perf_event] misses = %'llu, references = %'llu\
			(miss rate=%0.4f)\n",
			perf_count(cnts[CACHEMISSES]),
			perf_count(cnts[CACHEREFS]),
			(float)(perf_count(cnts[CACHEMISSES]))/
			(float)(perf_count(cnts[CACHEREFS])));

	printf("[perf_event] mflops=%'0.2f, instructions per flop=\
			%'0.2f\n", mflops, ipf);
}

void memory_test() {
	int fd[NUM_OF_FD];
	unsigned long long cnts[NUM_OF_FD][3];
	unsigned int us;
	struct timeval time1, time2;
	unsigned int *test_array;
	int i, j, n, z, sum = 0;

	test_array = (unsigned int*)malloc(N+0x10);
	//align on 16-byte boundary
	//FIXME: it may crash
	//test_array = (unsigned int*)(((unsigned int)test_array & ~0x1F) + 0x10);
	//initialize test_array
	for (i=0; i<(N>>2); i++) test_array[i] = 0;

	printf("----------------read test------------------\n");
	cnts_tick(fd);
	gettimeofday(&time1, 0);
	for (i=0; i<(N>>2); i++)
		sum += test_array[i];
	gettimeofday(&time2, 0);
	cnts_tock(fd, cnts);
	us = time2.tv_sec*1000000 + time2.tv_usec -
		time1.tv_sec*1000000 - time1.tv_usec;
	printf("[system clock] time = %d us\n", us);
	cnts_dump(cnts);
	printf("[sum] = %d\n", sum);

	printf("----------------write test------------------\n");
	cnts_tick(fd);
	gettimeofday(&time1, 0);
	for (i=0; i<(N>>2); i++)
		test_array[i] = 0;
	gettimeofday(&time2, 0);
	cnts_tock(fd, cnts);
	us = time2.tv_sec*1000000 + time2.tv_usec -
		time1.tv_sec*1000000 - time1.tv_usec;
	printf("[system clock] time = %d us\n", us);
	cnts_dump(cnts);
}

/*int main() {
	memory_test();

	return 0;
}*/

//gcc perf_event.c -O3 -o perf_event
//aarch64-linux-gnu-gcc perf_event.c -static -O3 -o perf_event

//RMX1821:/vendor/bin # ./perf_event
//----------------read test------------------
//[system clock] time = 35648 us
//[perf_event] cycles = 70785616 (1989 us)
//[perf_evcent]3596.66 MB/s
//[perf_event] instructions = 134303008(CPI=0.53)
//[perf_event] misses = 2107606, references = 44666380                    (miss rate=0.0472)
//[sum] = 0
//----------------write test------------------
//[system clock] time = 19154 us
//[perf_event] cycles = 38128948 (1989 us)
//[perf_evcent]6677.13 MB/s
//[perf_event] instructions = 8445098(CPI=4.51)
//[perf_event] misses = 7046, references = 2188893                        (miss rate=0.0032)
