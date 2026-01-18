#!/bin/sh

#dd if=../../original.bin of=boot.bin bs=64k count=25 >/dev/null 2>&1
../tools/splzo Kernel.bin Kernel.lzo
#cat boot.bin Kernel.lzo > tmp.bin
cat ../../bootonly.bin Kernel.lzo > tmp.bin
dd if=tmp.bin of=2m.bin ibs=2m conv=sync >/dev/null 2>&1
#rm boot.bin tmp.bin 
#scp 2m.bin 10.0.1.37:
