cmd_kernel/power/built-in.o :=  arm-linux-androideabi-ld -EL    -r -o kernel/power/built-in.o kernel/power/qos.o kernel/power/main.o kernel/power/console.o kernel/power/process.o kernel/power/suspend.o kernel/power/poweroff.o kernel/power/wakeup_reason.o 
