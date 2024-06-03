void myprint(char *ch)
{
	while(*ch) {
		myput((unsigned char *)0xb0000000, *ch);
		++ch;
	}
}

int main(void)
{
int len;
char buf[32];

	len = strlen("morimori");

	myput(0xb0000000, '0' + len);
	myprint("MORIMORI");

	for(;;) ;
}
