int main(void)
{
long *ptr;

	ptr = (long *)0xb0004000;

	bfprint("Hello World!!");
	bfprintf("MORIMORI %d\n", 1234);
	bfprintf("MORIMORI %x\n", *ptr);
	bfprintf("Company ID %d\n", (rd_prid() >> 16) & 0xff);
	bfprintf("MORIMORI %x\n", get());
	try();

	put('.');

	for(;;) ;
}
