#include "xprintf.h"

void xput(char ch)
{
	cput((unsigned char *)0xb0000000, ch);
}

void myprint(char *ch)
{
	while(*ch) {
		cput((unsigned char *)0xb0000000, *ch);
		++ch;
	}
}

int main(void)
{
int len;
char ch;
char str[128];

	xfunc_out=xput;

	cput(0xb0000000, '%');

	xprintf("MORIMORI %d",55);
	xsprintf(str, "MORIMORI %d\n", 55);
	myprint(str);
	xsprintf(str, "MORIMORI %x\n", str);
	myprint(str);

	for(;;) {
		if (cget(&ch)) {
			cput((unsigned char *)0xb0000000, ch);
		}
	}
}
