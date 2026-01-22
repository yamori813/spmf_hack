.global try
.global put
.global get
.global bfprint
.global bfprintf
.extern main

.set noreorder

.section .text

try:
	lui	$t9,0x8000
/*
	addiu	$t9,$t9, 0x0d14
SDRAM bnk=4,se=64Mb. DG bank count=0
SDRAM 64Mb
	addiu	$t9,$t9, 0x0f9c
0xb0007073=0x28,0xb0007080=0x2,0xb000705b=0x2
	addiu	$t9,$t9, 0x1b88
Mask ISP
USB2.0
	addiu	$t9,$t9, 0x331c
	addiu	$t9,$t9, 0x628c
	addiu	$t9,$t9, 0x7b04
	addiu	$t9,$t9, 0x7cc8
	addiu	$t9,$t9, 0x7ed4
	addiu	$t9,$t9, 0x812c
*/
	addiu	$t9,$t9, 0x0784
	jr	$t9
	nop
	eret

put:
	lui	$t9,0x8000
	addiu	$t9,$t9, 0x3948
	jr	$t9
	nop

get:
	lui	$t9,0x8000
	addiu	$t9,$t9, 0x7cc8
	jr	$t9
	nop

bfprint:
	lui	$t9,0x8000
	addiu	$t9,$t9, 9677
	jr	$t9
	nop

bfprintf:
/*
check put function (0x80007D58)
	lw	$t9,-32008($gp)
	lw	$a1,24($t9)
*/
	lui	$t9,0x8000
	addiu	$t9,$t9, 9725
	jr	$t9
	nop
