# halide-blur
Sample code of box blur built with Halide.

## Configuration
Due to the absent of the Halide building env. All the codes are pre-built and place in place. The building process is described as below.

## Building
### Build host generator and test app
make all

### Build generator only [optional]
make bin/host/halide_blur.generator

### Build test app for arm-cpu
make bin/arm-64-android/test

### Build test app for opencl
make bin/arm-64-android/test -f Makefile.opencl

### Build test app for arm-hvx
make bin/arm-64-android/test -f Makefile.hvx

### Build test app for host-hvx
make bin/host-hvx_128/test

## Test
Test on MSM8953
bin/arm-64-android-cpu/test
```
msm8953_64:/data/local/tmp/bin # ./arm-64-android-cpu/test
times: 1.790087 0.045505 0.028013
```
```
Monitor CPU thread while running

#while(true)
do
./toybox ps -T -p `pgrep test.cpu`
done

USER           PID   TID  PPID     VSZ    RSS WCHAN            ADDR S CMD            

root         12381 12381 16411  291392 183432 0          5555578e5c R test

root         12381 12838 16411  291392 183696 0          7f9d8cd524 R test

root         12381 12839 16411  291392 183696 0          7f9d8cd524 R test

root         12381 12840 16411  291392 183696 0          7f9d8cd524 R test

root         12381 12841 16411  291392 183960 0          7f9d8cd524 R test

root         12381 12842 16411  291392 183960 0          7f9d8cd524 R test

root         12381 12843 16411  291392 183960 0          7f9d8cd524 R test

root         12381 12844 16411  291392 183960 0          7f9d8cd524 R test

root         12381 12851 16411  291392 183960 0          7f9d87ddec R test

root         12381 12852 16411  291392 184224 0          7f9d87ddec R test

root         12381 12853 16411  291392 184224 0          7f9d87ddec R test

root         12381 12854 16411  291392 184488 0          7f9d87ddec R test

root         12381 12855 16411  291392 184488 0          7f9d87ddec R test

root         12381 12856 16411  291392 184488 0          7f9d87ddec R test

root         12381 12858 16411  291392 184488 0          7f9d87ddec R test
```
bin/arm-64-android-opencl/test
```
msm8953_64:/data/local/tmp/bin # ./arm-64-android-opencl/test                                            
times: 1.810480 0.053306 0.592977
```
```
Monitor GPU load while running
#while(true)
do
cat /sys/class/kgsl/kgsl-3d0/devfreq/gpu_load
done                                                                                                                            
0  

...

...

0 

98

0

...

...

0

98 

0  

0 

100

0 

0  
```

