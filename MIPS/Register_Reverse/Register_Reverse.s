# Reverse bits in a register
#

	.data
	n: .word 7

	.text

	.globl	main

	main:

	li	$s0, 0x01001101
	lw	$s1, n
	lw	$s2, 1


	loop:

	sll	$s4, $s0, $s1
	addi	$s1, $s1, -1
	bne	$s2, $s1, loop


	li	$v0, 10
	syscall