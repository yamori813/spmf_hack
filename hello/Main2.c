#include <string.h>

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

	cput(0xb0000000, '#');
	len = strlen("morimori");
	cput(0xb0000000, '0' + len);
	strcpy(str, "MORIMORI");
	myprint(str);
	cput(0xb0000000, '#');

	for(;;) {
		if (cget(&ch)) {
			cput((unsigned char *)0xb0000000, ch);
		}
	}
}

