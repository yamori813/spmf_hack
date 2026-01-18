#
#
#

CROSSTOOL=mips
CROSSBU=mips-unknown-freebsd13.0
COPT=-nostdlib -fno-builtin -nostartfiles -nodefaultlibs -march=4kc -G 0 -fno-pic -mno-abicalls -O2 -G 0

NEWLIB=../build/work/newlib-3.0.0.20180831/mips/el/newlib/libc.a 
GCCLIB=/usr/local/lib/gcc/mips/4.9.2/el/

all:
	$(CROSSBU)-as -march=mips32 -EL -o Entry.o Entry.S
	$(CROSSTOOL)-gcc -EL -o Main.o -c Main.c -nostdlib -fno-builtin -nostartfiles -nodefaultlibs -O2
	$(CROSSBU)-ld -EL -T ldscript -o Kernel.elf Entry.o Main.o
	$(CROSSBU)-objcopy -O binary Kernel.elf Kernel.bin

nl:
	$(CROSSBU)-as -EL -o Entry.o Entry.S
	$(CROSSTOOL)-gcc -EL -o Main2.o -c Main2.c $(COPT)
	$(CROSSTOOL)-gcc -EL -o uart.o -c uart.c $(COPT)
	$(CROSSBU)-ld -EL -T ldscript -o Kernel.elf Entry.o Main2.o uart.o $(NEWLIB) -L$(GCCLIB) -lgcc
	$(CROSSBU)-objcopy -O binary Kernel.elf Kernel.bin

clean:
	rm -rf Kernel.* *.o
