#
#
#

CROSSTOOL=mips
CROSSBU=mips-unknown-freebsd13.0

CROSS_CFLAGS = -I../build/work/newlib-3.0.0.20180831/newlib/libc/include/
CROSS_CFLAGS += -O2 -march=mips32 -EL -G 0
CROSS_CFLAGS += -fno-pic -mno-abicalls
CROSS_CFLAGS += -fno-strict-aliasing -fno-common -fomit-frame-pointer
CROSS_CFLAGS += -pipe -mlong-calls

#CROSS_CFLAGS = -I../build/work/newlib-3.0.0.20180831/newlib/libc/include/
#CROSS_CFLAGS += -nostdlib -fno-builtin -nostartfiles -nodefaultlibs -march=mips32 -fno-pic -mno-abicalls -O2 -G 0 -EL

NEWLIB=../build/work/newlib-3.0.0.20180831/mips/el/newlib/libc.a 
GCCLIB=/usr/local/lib/gcc/mips/4.9.2/el/

all:
	$(CROSSBU)-as -march=mips64 -EL -o Entry.o Entry.S
	$(CROSSTOOL)-gcc -EL -march=mips64 -o Main.o -c Main.c -nostdlib -fno-builtin -nostartfiles -nodefaultlibs -O2
	$(CROSSBU)-ld -static -EL -T ldscript -o Kernel.elf Entry.o Main.o
	$(CROSSBU)-objcopy -O binary Kernel.elf Kernel.bin
	./mkimg.sh

nl:
	$(CROSSBU)-as -EL -o Entry.o Entry.S
	$(CROSSTOOL)-gcc $(CROSS_CFLAGS) -c Main2.c
	$(CROSSTOOL)-gcc $(CROSS_CFLAGS) -c uart.c
	$(CROSSBU)-ld -static -EL -T ldscript -o Kernel.elf Entry.o Main2.o uart.o $(NEWLIB) -L$(GCCLIB) -lgcc
	$(CROSSBU)-objcopy -O binary Kernel.elf Kernel.bin
	./mkimg.sh

xp:
	$(CROSSBU)-as -EL -o Entry.o Entry.S
	$(CROSSTOOL)-gcc $(CROSS_CFLAGS) -c Main3.c
	$(CROSSTOOL)-gcc $(CROSS_CFLAGS) -c uart.c
	$(CROSSTOOL)-gcc -EL -c xprintf.c
	$(CROSSBU)-ld -static -EL -T ldscript -o Kernel.elf Entry.o Main3.o uart.o xprintf.o 
	$(CROSSBU)-objcopy -O binary Kernel.elf Kernel.bin
	./mkimg.sh

clean:
	rm -rf Kernel.* *.o
