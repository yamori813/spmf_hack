.global start
.global put
.global get
.global myput
.global print
.global printf
.global rd_count
.global rd_prid
.extern main

.set noreorder

.set STACKSIZE, 0x1000

.section .text

start:
	mfc0	$t1, $20
	ori	$t1, $t1, 0xc
	andi	$t1, $t1, 0xfffc
	mtc0	$t1, $20
	nop
	andi	$t1, $t1, 0xffff
	mtc0	$t1, $20
	andi	$t1, $t1, 0xfff3
	mtc0	$t1, $20
/*
	lui	$sp, 0xd000
	addiu	$sp, $sp, 8188
*/
# bss clear
	la	$8,_fbss
	la	$9,_end
1:	sw	$0,0($8)
	add	$8,4
	blt	$8,$9,1b
	nop

	li	$sp, 0x80800000
	lui	$a0, 0xb000
	li	$a1, '*'
	jal	myput
	nop
	jal	init
	nop
	jal	main
	nop
	b .
	nop
	.space 0x200

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

rd_prid:
	mfc0	$v0, $15
	jr	$ra
	nop

init:
	lui	$t0,0xb000
	li	$t1,1
	sb	$t1,8354($t0)
	sb	$t1,8353($t0)
	li	$t1,16
	sb	$t1,16440($t0)
	sb	$t1,16432($t0)
	li	$t1,15
	sb	$t1,96($t0)
	lui	$t1,0x8b
	ori	$t1,$t1,0x245
	sw	$t1,100($t0)
	li	$t1,1
	sb	$t1,137($t0)
	sb	$zero,4($t0)
	sw	$zero,4104($t0)
	sw	$zero,4108($t0)
	li	$t1,-1
	sb	$t1,0($t0)
	sh	$t1,4096($t0)
	sw	$t1,4100($t0)
	li	$t1,22529
	sh	$t1,4104($t0)
	sb	$zero,4208($t0)
	lui	$t1,0xd000
	sw	$t1,4192($t0)
	lui	$t1,0xd000
	ori	$t1,$t1,0x1fff
	sw	$t1,4196($t0)
	lh	$t1,88($t0)
	sh	$zero,256($t0)
	sh	$zero,258($t0)
	jr	$ra
	nop

.section .bss
/*
stack:
	.space STACKSIZE
*/

