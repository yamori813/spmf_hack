#include <string.h>
#include <stdlib.h>

#include "xprintf.h"

void xput(unsigned char ch)
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
char *ptr;

	xfunc_out=xput;

	cput(0xb0000000, '%');

	xsprintf(str, "MORIMORI %d\n", strlen("MORIMORI"));
	myprint(str);
	xsprintf(str, "MORIMORI %x\n", str);
	myprint(str);
	ptr = malloc(1024);
	xsprintf(str, "MORIMORI %x\n", ptr);
	myprint(str);
	ptr = malloc(1024);
	xsprintf(str, "MORIMORI %x\n", ptr);
	myprint(str);

	for(;;) {
		if (cget(&ch)) {
			cput((unsigned char *)0xb0000000, ch);
		}
	}
}
