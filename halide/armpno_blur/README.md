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
0
0  
...

...
0 
0
0 
98
0
0  
0
0
0 
0
0  
0
0
0  
0  
0
0  
0                         
0  
0  
0 
0  
0 
0
98 
0  
0  
0
0  
0
0
0  
0
0 
0  
0
0  
0
0
0
0  
0  
0
0
0  
0
0 
100
0 
0  
```

