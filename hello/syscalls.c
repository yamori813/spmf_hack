#include "xprintf.h"

extern char _end[];

void *
_sbrk (incr)
     int incr;
{
   static char * heap_end;
   char *        prev_heap_end;

   prev_heap_end = heap_end;
   heap_end += incr;

   return (void *) ((int)_end + (int)prev_heap_end);
}

char * sbrk (int) __attribute__((weak, alias ("_sbrk")));
