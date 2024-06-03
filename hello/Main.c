int main(void)
{
long *ptr;

	ptr = (long *)0xb0004000;

	print("Hello World!!");
	printf("MORIMORI %d\n", 1234);
	printf("MORIMORI %x\n", *ptr);
	printf("MORIMORI %x\n", rd_count());
	printf("MORIMORI %x\n", get());

	put('.');

	for(;;) ;
}
