int main(void)
{
int len;

	len = strlen("morimori");

	myput(0xb0000000, '0' + len);

	for(;;) ;
}
