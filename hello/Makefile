#
#
#

CROSSTOOL=mips
CROSSBU=mips-unknown-freebsd13.0

all:
	$(CROSSBU)-as -EL -o Entry.o Entry.S
	$(CROSSTOOL)-gcc -EL -o Main.o -c Main.c -nostdlib -fno-builtin -nostartfiles -nodefaultlibs -O2
	$(CROSSBU)-ld -EL -T ldscript -o Kernel.elf Entry.o Main.o
	$(CROSSBU)-objcopy -O binary Kernel.elf Kernel.bin

clean:
	rm -rf Kernel.* *.o
