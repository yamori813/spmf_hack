.global start
.global put
.global get
.global myput
.global print
.global printf
.global rd_count
.extern main

.set noreorder

.set STACKSIZE, 0x1000

.section .text

start:
	la $sp, stack
	addiu $sp, STACKSIZE - 32
	jal main
	nop
	b .
	nop

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

myput:
	andi	$a1,$a1,0xff
l1:
	lbu	$v0,4353($a0)	/* 0x1101 */
	nop
	srl	$v0, $v0, 0x5
	andi	$v0, $v0, 0x1
	beqz	$v0, l1
	nop
	jr	$ra
	sb	$a1,4360($a0)	/* 0x1108 */

print:
	lui	$t9,0x8000
	addiu	$t9,$t9, 9677
	jr	$t9
	nop

printf:
/*
check put function (0x80007D58)
	lw	$t9,-32008($gp)
	lw	$a1,24($t9)
*/
	lui	$t9,0x8000
	addiu	$t9,$t9, 9725
	jr	$t9
	nop

/* not work */
rd_count:
	mfc0	$v0, $9
	jr	$ra
	nop

.section .bss
stack:
	.space STACKSIZE

