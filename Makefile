.PHONY: all

host_targets = bubble_sort perf_event horner_omp image_transformation image_trans_fp opencl

arm_targets = bubble_sort_arm perf_event_arm horner_omp_arm image_transformation_arm image_trans_fp_arm opencl_arm

all: ${host_targets} ${arm_targets}

GCC = gcc
HOST_CFLAGS = -g -fopenmp #-O3
HOST_LDFLAGS = -lm 

ARM_GCC = aarch64-linux-gnu-gcc
ARM_CFLAGS = -g -fopenmp -static#-O3
ARM_LDFLAGS = -lm 

%: %.c
	${GCC} $^ ${HOST_CFLAGS} ${HOST_LDFLAGS} -o $@

%_arm: %.c
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
	rm -rf ${host_targets} ${arm_targets}
