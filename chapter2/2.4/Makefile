.PHONY: all

#host_targets = horner_method

arm_targets = omp_scope_arm

all: ${arm_targets}

#CLANG = clang
#HOST_CFLAGS = -g -O3
#HOST_LDFLAGS = -lm 

ARM_CLANG = armv7a-linux-androideabi28-clang
ARM_CFLAGS = -g -static -O3 -fopenmp
ARM_LDFLAGS = -lm

%_arm: %.c
	${ARM_CLANG} $^ ${ARM_CFLAGS} ${ARM_LDFLAGS}  -o $@

clean:
	rm -rf ${arm_targets}
