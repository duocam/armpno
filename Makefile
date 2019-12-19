.PHONY: all 

host_targets = chapter1/1.9/perf_event

arm_targets = chapter1/1.9/perf_event_arm

all: ${host_targets} ${arm_targets}

GCC = gcc
HOST_CFLAGS = -g -fopenmp -O3
HOST_LDFLAGS = -lm 

ARM_GCC = armv7a-linux-androideabi28-clang
ARM_CFLAGS = -g -fopenmp -static -O3
ARM_LDFLAGS = -lm 

%: %.c
	${GCC} $^ ${HOST_CFLAGS} ${HOST_LDFLAGS} -o $@
	@echo "Test" $@
	./$@
	@echo ""

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
