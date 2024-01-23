.global start
.global print
.global printf
.extern main

.set noreorder

.set STACKSIZE, 0x1000

.section .text

start:
	lui $sp, 0xd000
	addiu $sp, $sp, 8188
	lui $gp, 0x800c
	addiu $gp, $gp, -9936
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

