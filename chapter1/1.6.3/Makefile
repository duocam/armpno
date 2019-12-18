.PHONY: all

arm_targets = bubble_sort

all: ${arm_targets}

ARM_CLANG = armv7a-linux-androideabi28-clang
ARM_CFLAGS = -g -static -O3
ARM_LDFLAGS = -lm

bubble_sort: main.c bubble_sort.c bubble_sort_asm.s
	${ARM_CLANG} $^ ${ARM_CFLAGS} ${ARM_LDFLAGS} -o $@

clean:
	rm -rf ${arm_targets}
