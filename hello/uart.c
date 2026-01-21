/*
 */


int cget(unsigned char *ch)
{
	int tmp;
	unsigned char *addr;
	addr = (unsigned char *)0xb0000000;
	asm volatile ("lbu     %0,0x1101(%1)\n\tnop"
	: "=r" (tmp) : "r" (addr));
	if (((tmp >> 1) & 1) == 0) {
		return 0;
	} else {
		*ch = *(addr + 0x110c);
		return 1;
	}
}

void cput(unsigned char *addr, unsigned char ch)
{
	int tmp;

	do {
//		tmp = *(addr + 0x1101);
		asm volatile ("lbu     %0,0x1101(%1)\n\tnop"
		: "=r" (tmp) : "r" (addr));
	} while(!((tmp >> 5) & 1));
	*(addr + 0x1108) = ch;
}

