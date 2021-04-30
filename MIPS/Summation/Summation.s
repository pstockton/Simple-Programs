# First "n" positive integer
#

	.data

	n: .word 10		# Integer "n" value
	neg_n: .word -10		# Initial counter value
	pos_n: .word 1		# Beginning of loop (positive value)

	.text

	.globl main


	main:

	li 	$s0, 0		# Begin the summation at 0
	lw 	$s1, n		# Register for "n"
	lw 	$s2, pos_n		# Stop point/value
	lw 	$s3, neg_n	# Counter Start (negative)

	loop:

	add 	$s0, $s0, $s1	# Add summation and "n"
	addi 	$s1, $s1, -1	# Decrement "n" by 1
	addi 	$s3, $s3, 1 	# Increment the counter
	bne 	$s3, $s2, loop	# Test for stop point/value


	li	$v0, 10
	syscall
