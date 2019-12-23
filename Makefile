.PHONY: all 

C1 = chapter1/

c1_host_targets = $(C1)1.9/perf_event $(C1)1.6.1/bubble_sort

c1_arm_targets = $(C1)1.9/perf_event_arm $(C1)1.6.1/bubble_sort_arm $(C1)1.6.2/bubble_sort_asm $(C1)1.6.3/bubble_sort

all: ${c1_host_targets} ${c1_arm_targets}

GCC = gcc
HOST_CFLAGS = -g -fopenmp -O3
HOST_LDFLAGS = -lm 

ARM_GCC = armv7a-linux-androideabi28-clang
ARM_CFLAGS = -g -fopenmp -static -O3
ARM_LDFLAGS = -lm 

%: %.c
	${GCC} $^ ${HOST_CFLAGS} ${HOST_LDFLAGS} -o $@

%_arm: %.c
	${ARM_GCC} $^ ${ARM_CFLAGS} ${ARM_LDFLAGS}  -o $@

%: %.s
	${ARM_GCC} $^ ${ARM_CFLAGS} ${ARM_LDFLAGS}  -o $@

$(C1)1.6.3/bubble_sort: $(C1)1.6.3/main.c $(C1)1.6.3/bubble_sort.c $(C1)1.6.3/bubble_sort_asm.s
	${ARM_GCC} $^ ${ARM_CFLAGS} ${ARM_LDFLAGS}  -o $@

image_trans_fp: image_transformation.c
	${GCC} $^ ${HOST_CFLAGS} ${HOST_LDFLAGS} -DUSEFP=1 -o $@

image_trans_fp_arm: image_transformation.c
	${ARM_GCC} $^ ${ARM_CFLAGS} ${ARM_LDFLAGS} -DUSEFP=1  -o $@_arm

opencl: opencl.c
	${GCC} $^ ${HOST_CFLAGS} ${HOST_LDFLAGS} -lOpenCL -o $@

opencl_arm: opencl.c
	${GCC} $^ ${ARM_CFLAGS} ${ARM_LDFLAGS} -lOpenCL -o $@

clean:
	rm -rf ${c1_host_targets} ${c1_arm_targets}
