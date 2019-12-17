# armpno
Sample code of &lt;&lt;ARM Programming and Optimization>>

## Configuration
### Toolchain
gcc on host

aarch64-linx-gnu-gcc on ARM

## Build
### Make host targets
make host_targets

### Make ARM targets
make arm_targets

### Make specific targets
make bubble_sort
make bubble_sort_arm

## Test
### Test on Host
./bubble_sort

### Test on ARM
adb root
adb remount
adb push ./bubble_sort_arm /data/local/tmp
adb shell /data/local/tmp/bubble_sort_arm
