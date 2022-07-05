.global start
.global print
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
	addiu	$sp,$sp,-4
	sw      $ra,0($sp)
	lui	$3,0x8000
	addiu	$3,$3, 9677
	jr	$3
	lw      $ra,0($sp)
	j	$ra
	addiu	$sp,$sp,4

.section .bss
stack:
	.space STACKSIZE

