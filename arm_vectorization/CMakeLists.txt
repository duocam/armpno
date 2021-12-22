cmake_minimum_required (VERSION 3.1)
project (opencv_sample)

find_package (Threads)

set("OpenCV_DIR" /root/opencv_build/install/sdk/native/jni/abi-arm64-v8a)
find_package( OpenCV REQUIRED )


#set (CMAKE_C_COMPILER "/workspace/toolchain/android-ndk-r23b/toolchains/llvm/prebuilt/linux-x86_64/bin/clang")
set (CMAKE_C_COMPILER "/workspace/toolchain/android-ndk-r23b/toolchains/llvm/prebuilt/linux-x86_64/bin/clang")
set (CMAKE_CXX_COMPILER "/workspace/toolchain/android-ndk-r23b/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++")
set (CMAKE_CXX_STANDARD 17)

add_executable(helloav example_vector_addition_auto_vectorization.cc)
target_include_directories(helloav SYSTEM PUBLIC /workspace/toolchain/android-ndk-r23b/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include)
target_compile_options(helloav PRIVATE -g)
target_compile_options(helloav PRIVATE --target=aarch64-linux-android31)
#target_compile_options(helloav PRIVATE -fvectorize)
target_compile_options(helloav PRIVATE -Os)
