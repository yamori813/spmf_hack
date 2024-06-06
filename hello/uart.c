/*
 */

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

