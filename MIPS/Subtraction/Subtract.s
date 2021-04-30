# Demo Program
#
# Filename: Subtract
#
# This program demostrates the 'sub' instruction
#

	# Data Segment
	.data

	# Text Segment
	.text

	.globl my_main

my_main:

	# Result is positive
	li	$t1, 0x2222
	li	$t2, 0x1111
	sub	$t3, $t1, $t2		# t3 = t1 - t2

	li	$t1, 0xFFFF
	li	$t2, 0x0001
	sub	$t3, $t1, $t2		# t3 = t1 - t2

	li	$t1, 0x7FFFFFFF		# Largest signed number in 2's complement, 0111...
	li	$t2, 0x00000001
	sub	$t3, $t1, $t2		# t3 = t1 - t2


	# Result is negative (2's complement)
	li	$t1, 0x1111
	li	$t2, 0x2222
	sub	$t3, $t1, $t2		# t3 = t1 - t2

	li	$t1, 0x0001
	li	$t2, 0xFFFF
	sub	$t3, $t1, $t2		# t3 = t1 - t2

	li	$t1, 0x00000001
	li	$t2, 0xFFFFFFFF
	sub	$t3, $t1, $t2		# t3 = t1 - t2

	li	$t1, 0xFFFFFFFF
	li	$t2, 0xFFFFFFFE
	sub	$t3, $t1, $t2		# t3 = t1 - t2


	# Exit Program
	li $v0, 10
	syscall
	