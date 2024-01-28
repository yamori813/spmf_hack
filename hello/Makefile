#
#
#

CROSSTOOL=mips
CROSSBU=mips-unknown-freebsd13.0

all:
	$(CROSSBU)-as -march=mips32 -EL -o Entry.o Entry.S
	$(CROSSTOOL)-gcc -EL -o Main.o -c Main.c -nostdlib -fno-builtin -nostartfiles -nodefaultlibs -O2
	$(CROSSBU)-ld -EL -T ldscript -o Kernel.elf Entry.o Main.o
	$(CROSSBU)-objcopy -O binary Kernel.elf Kernel.bin

nl:
	$(CROSSBU)-as -EL -o Entry.o Entry.S
	$(CROSSTOOL)-gcc -EL -o Main2.o -c Main2.c -nostdlib -fno-builtin -nostartfiles -nodefaultlibs -O2
	$(CROSSBU)-ld -EL -T ldscript -o Kernel.elf Entry.o Main2.o ../../spbm-mruby/build/work/newlib-3.0.0.20180831/mips/el/newlib/libc.a
	$(CROSSBU)-objcopy -O binary Kernel.elf Kernel.bin

clean:
	rm -rf Kernel.* *.o
