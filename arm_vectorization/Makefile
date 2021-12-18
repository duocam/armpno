CC = clang

OBJDUMP = llvm-objdump

FLAGS = --target=aarch64-arm-none-eabi -g -c -O1 

VFLAGS = --target=aarch64-arm-none-eabi -g -c -O1 -fvectorize

.PHONY : clean all

TARGET = vec_i.txt non_vec.txt vec_i.o non_vec.o

all : ${TARGET}

clean :
	rm -rf ${TARGET}

non_vec.o : example_vector_addition_auto_vectorization.cc
	${CC} ${VFLAGS}  $^ -o $@

non_vec.txt : non_vec.o
	${OBJDUMP} -d $^ > $@

vec_i.o : example_vector_addition_auto_vectorization.cc
	${CC} ${VFLAGS}  $^ -o $@

vec_i.txt : vec_i.o
	${OBJDUMP} -d $^ > $@
