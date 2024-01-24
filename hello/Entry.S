.global start
.global put
.global aput
.global print
.global printf
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

aput:
	lui	$t9,0xb000
	andi	$a0,$a0,0xff
l1:
	lbu	$v0,4353($t9)
	nop
	srl	$v0, $v0, 0x5
	andi	$v0, $v0, 0x1
	beqz	$v0, l1
	nop
	jr	$ra
	sb	$a0,4360($t9)

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

.section .bss
stack:
	.space STACKSIZE

