#!/bin/sh

dd if=../../original.bin of=boot.bin bs=64k count=25 >/dev/null 2>&1
../tools/splzo ../hello/Kernel.bin Kernel.lzo
cat boot.bin Kernel.lzo > tmp.bin
dd if=tmp.bin of=2m.bin ibs=2m conv=sync >/dev/null 2>&1
rm boot.bin tmp.bin 
