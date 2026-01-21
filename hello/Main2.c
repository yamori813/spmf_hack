#include <string.h>

extern char _end[];

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

void *
_sbrk (incr)
     int incr;
{
   static char * heap_end = _end;
   char *        prev_heap_end;

   prev_heap_end = heap_end;
   heap_end += incr;

   return (void *) prev_heap_end;
}

char * sbrk (int) __attribute__((weak, alias ("_sbrk")));
