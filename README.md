# armpno
Sample code of &lt;&lt;ARM Programming and Optimization>>

## Configuration
### Toolchain
gcc on host.

armv7a-linux-androideabi28-clang for cross compilation.

## Build
```
make all
```

### Make specific targets
```
make chapter1/1.9/perf_event
make chapter1/1.9/perf_event_arm
```

## Test
### Test on Host
```
./chapter1/1.9/perf_event
```

### Test on ARM
```
adb root
adb remount
adb push ./chapter1/1.9/perf_event_arm /data/local/tmp
adb shell /data/local/tmp/perf_event_arm
```
