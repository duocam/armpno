.PHONY: all 

C1 = chapter1/
C3 = chapter3/

c1_host_targets = $(C1)1.9/perf_event $(C1)1.6.1/bubble_sort $(C3)image_transformation $(C3)image_trans_fp

c1_arm_targets = $(C1)1.9/perf_event_arm $(C1)1.6.1/bubble_sort_arm $(C1)1.6.2/bubble_sort_asm $(C1)1.6.3/bubble_sort $(C3)image_transformation_arm $(C3)image_trans_fp_arm

all: ${c1_host_targets} ${c1_arm_targets}

GCC = gcc
HOST_CFLAGS = -g -fopenmp -O3
HOST_LDFLAGS = -lm 

ARM_GCC = armv7a-linux-androideabi28-clang
ARM_CFLAGS = -g -fopenmp -static -DARM=1 -O3
ARM_LDFLAGS = -lm 

%: %.c
	${GCC} $^ ${HOST_CFLAGS} ${HOST_LDFLAGS} -o $@

%_arm: %.c
	${ARM_GCC} $^ ${ARM_CFLAGS} ${ARM_LDFLAGS}  -o $@

%: %.s
	${ARM_GCC} $^ ${ARM_CFLAGS} ${ARM_LDFLAGS}  -o $@

$(C1)1.6.3/bubble_sort: $(C1)1.6.3/main.c $(C1)1.6.3/bubble_sort.c $(C1)1.6.3/bubble_sort_asm.s
	${ARM_GCC} $^ ${ARM_CFLAGS} ${ARM_LDFLAGS}  -o $@

$(C3)image_trans_fp: $(C3)image_transformation.c
	${GCC} $^ ${HOST_CFLAGS} ${HOST_LDFLAGS} -DUSEFP=1 -o $@

$(C3)image_trans_fp_arm: $(C3)image_transformation.c
	${ARM_GCC} $^ ${ARM_CFLAGS} ${ARM_LDFLAGS} -DUSEFP=1  -o $@

opencl: opencl.c
	${GCC} $^ ${HOST_CFLAGS} ${HOST_LDFLAGS} -lOpenCL -o $@

opencl_arm: opencl.c
	${GCC} $^ ${ARM_CFLAGS} ${ARM_LDFLAGS} -lOpenCL -o $@

clean:
	rm -rf ${c1_host_targets} ${c1_arm_targets}
