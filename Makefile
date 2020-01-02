.PHONY: all  clean

C1 = chapter1/
C3 = chapter3/


c1_host_targets : $(C1)1.9/perf_event $(C1)1.6.1/bubble_sort $(C3)image_transformation $(C3)image_trans_fp

c1_arm_targets : $(C1)1.9/perf_event_arm $(C1)1.6.1/bubble_sort_arm $(C1)1.6.2/bubble_sort_asm $(C1)1.6.3/bubble_sort $(C3)image_transformation_arm $(C3)image_trans_fp_arm

c3_host_targets : $(C3)image_transformation $(C3)image_trans_fp

c3_arm_targets : $(C3)image_transformation_arm $(C3)image_trans_fp_arm

all: c1_host_targets c1_arm_targets c3_host_targets c3_arm_targets opencl_hello_world_arm opencl_hello_world_arm64

GCC = gcc
HOST_CFLAGS = -g -fopenmp -O3 -Wno-implicit-function-declaration -Wno-unused-result -Wno-pointer-to-int-cast
HOST_LDFLAGS = -lm 

ARM_CLANG = armv7a-linux-androideabi28-clang
ARM64_CLANG = aarch64-linux-android28-clang
ARM_CLANG++ = armv7a-linux-androideabi28-clang++
ARM64_CLANG++ = aarch64-linux-android28-clang++
ARM_CFLAGS = -g -fopenmp -static -DARM=1 -O3 -Wno-implicit-function-declaration -Wno-unused-result -Wno-pointer-to-int-cast
ARM_LDFLAGS = -lm 

%: %.c
	${GCC} $^ ${HOST_CFLAGS} ${HOST_LDFLAGS} -o $@

%_arm: %.c
	${ARM_CLANG} $^ ${ARM_CFLAGS} ${ARM_LDFLAGS}  -o $@

%: %.s
	${ARM_CLANG} $^ ${ARM_CFLAGS} ${ARM_LDFLAGS}  -o $@

$(C1)1.6.3/bubble_sort: $(C1)1.6.3/main.c $(C1)1.6.3/bubble_sort.c $(C1)1.6.3/bubble_sort_asm.s
	${ARM_CLANG} $^ ${ARM_CFLAGS} ${ARM_LDFLAGS}  -o $@

$(C3)image_trans_fp: $(C3)image_transformation.c
	${GCC} $^ ${HOST_CFLAGS} ${HOST_LDFLAGS} -DUSEFP=1 -o $@

$(C3)image_trans_fp_arm: $(C3)image_transformation.c
	${ARM_CLANG} $^ ${ARM_CFLAGS} ${ARM_LDFLAGS} -DUSEFP=1  -o $@

ARM_CL_FLAGS = -static-libstdc++ -pie -fPIE -Icl_env/OpenCL -Ofast
opencl_hello_world_arm: cl_env/src/HelloWorld.cpp
	${ARM_CLANG++} $^ ${ARM_CL_FLAGS} -Lcl_env/OpenCL/arm_lib -lOpenCL -fuse-ld=gold -o cl_env/out/$@

opencl_hello_world_arm64: cl_env/src/HelloWorld.cpp
	${ARM64_CLANG++} $^ ${ARM_CL_FLAGS} -Lcl_env/OpenCL/aarch64_lib -lOpenCL -fuse-ld=gold -o cl_env/out/$@


clean: 
	@find chapter* -executable -type f | xargs rm -rf
