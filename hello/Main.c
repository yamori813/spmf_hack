void initlcd()
{
unsigned char *ptr8;
unsigned char c;

	ptr8 = (unsigned char *)0xb000103c;
	c = *ptr8;
	c &= -10;
	*ptr8 = c;

	ptr8 = (unsigned char *)0xb0001034;
	c = *ptr8;
	c &= -2;
	*ptr8 = c;
	c |= 8;
	*ptr8 = c;

	ptr8 = (unsigned char *)0xb0001030;
	c = *ptr8;
	c |= 8;
	*ptr8 = c;

	ptr8 = (unsigned char *)0xb000a108;
	c = *ptr8;
	c |= -128;
	*ptr8 = c;

	ptr8 = (unsigned char *)0xb000a114;
	c = *ptr8;
	c |= -128;
	*ptr8 = c;

	ptr8 = (unsigned char *)0xb000a110;
	c = *ptr8;
	c |= -128;
	*ptr8 = c;
}

int main(void)
{
long *ptr;

	ptr = (long *)0xb0004000;

	print("Hello World!!");
	printf("MORIMORI %d\n", 1234);
	printf("MORIMORI %x\n", *ptr);
	printf("MORIMORI %x\n", rd_count());
	printf("MORIMORI %x\n", get());

	initlcd();

	put('.');

	for(;;) ;
}
