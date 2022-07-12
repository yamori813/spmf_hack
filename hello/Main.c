int main(void)
{
long *ptr;
	ptr = (long *)0xb00011c4;

	print("Hello World!!");
	printf("MORIMORI %d\n", 1234);
	printf("MORIMORI %x\n", *ptr);
	for(;;) ;
}
