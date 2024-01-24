int main(void)
{
long *ptr;
unsigned char *ptr8;

	ptr = (long *)0xb0004000;

	print("Hello World!!");
	printf("MORIMORI %d\n", 1234);
	printf("MORIMORI %x\n", *ptr);
	put('m');
	aput('a');

	for(;;) ;
}
