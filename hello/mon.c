#include <string.h>
#include <stdlib.h>

#include "xprintf.h"

void myprint(char *ch)
{
	while(*ch) {
		cput((unsigned char *)0xb0000000, *ch);
		++ch;
	}
}

void hprint(int n)
{
int i, t;
	for (i = 0; i < 8; ++i) {
		t = (n >> (4 * (7 - i))) & 0xf;
		if (t >= 10)
			cput((unsigned char *)0xb0000000, t - 10 + 'a');
		else
			cput((unsigned char *)0xb0000000, t + '0');
	}
}

unsigned int htoi(char *buf)
{
unsigned int res, n;

	n = 0;
	res = 0;
	while(buf[n] != 0) {
		if ((buf[n] <= 'f' && buf[n] >= 'a') ||
		    (buf[n] <= '9' && buf[n] >= '0')) {
			res <<= 4;
			if (buf[n] >= 'a') {
				res += buf[n] - 'a' + 10;
			} else {
				res += buf[n] - '0';
			}
		}
		++n;
	}

	return res;
}

int main(void)
{
int i, n;
char ch;
char cmd[128];
char str[128];
char *arg2;
int *addr;
int val;

	myprint(" spmf2800 monitor start\r\n");
	myprint("> ");

	n = 0;
	for(;;) {
		if (cget(&ch)) {
			cmd[n] = ch;
			cput((unsigned char *)0xb0000000, cmd[n]);
			++n;
			if (ch == '\r') {
				cput((unsigned char *)0xb0000000, '\n');
				cmd[n - 1] = 0;
				if (cmd[0] == 'D') {
					addr = (int *)htoi(cmd + 2);
					hprint((int)addr);
					myprint(" ");
					for (i = 0; i < 16; i += 4) {
						myprint(" ");
						hprint(*(addr + i));
					}
					myprint("\r\n");
				} else if (cmd[0] == 'G') {
					addr = (int *)htoi(cmd + 2);
					jmp(addr);
				} else if (cmd[0] == 'W') {
					i = 2;
					arg2 = 0;
					while(cmd[i] != 0) {
						if (cmd[i] == ' ') {
							arg2 = cmd + i + 1;
							cmd[i] = 0;
							break;
						}
						++i;
					}
					if (arg2) {
						addr = (int *)htoi(cmd + 2);
						val = htoi(arg2);
						*addr = val;
					}
				} else
					myprint("error\r\n");
				n = 0;	
				myprint("> ");
			}
		}
	}
}
