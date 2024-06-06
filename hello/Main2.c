

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

	len = strlen("morimori");

	cput(0xb0000000, '0' + len);
	myprint("MORIMORI");

	for(;;) ;
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
