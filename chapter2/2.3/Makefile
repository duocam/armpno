.PHONY: all

#host_targets = horner_method

arm_targets = horner_method_arm

all: ${host_targets} ${arm_targets}

#CLANG = clang
#HOST_CFLAGS = -g -O3
#HOST_LDFLAGS = -lm 

ARM_CLANG = armv7a-linux-androideabi28-clang
ARM_CFLAGS = -g -static -O3
ARM_LDFLAGS = -lm

%: %.c perf_event.c
	${CLANG} $^ ${HOST_CFLAGS} ${HOST_LDFLAGS} -o $@

%_arm: %.c perf_event.c
	${ARM_CLANG} $^ ${ARM_CFLAGS} ${ARM_LDFLAGS}  -o $@

clean:
	rm -rf ${host_targets} ${arm_targets}
