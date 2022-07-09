.global start
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

print:
	lui	$t9,0x8000
	addiu	$t9,$t9, 9677
	jr	$t9
	nop

printf:
	lui	$t9,0x8000
	addiu	$t9,$t9, 9725
	jr	$t9
	nop

.section .bss
stack:
	.space STACKSIZE

