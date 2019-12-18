.PHONY: all

arm_targets = bubble_sort_asm

all: ${arm_targets}

ARM_CLANG = armv7a-linux-androideabi28-clang
ARM_CFLAGS = -g -static -O3
ARM_LDFLAGS = -lm

%: %.s
	${ARM_CLANG} $^ ${ARM_CFLAGS} ${ARM_LDFLAGS} -o $@

clean:
	rm -rf ${arm_targets}
