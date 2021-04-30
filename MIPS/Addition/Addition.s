# Demo Program
#
# Filename: Add
#
# Addition of registers
#

	# Data Section
	.data


	# Text Section
	.text


	.globl	my_main		# Define a label, my_main

my_main:

	# Main code goes here
	li	$t1, 0x1111
	li	$t2, 0x2222
	add	$t3, $t1, $t2

	# Show a carry
	li	$t1, 0x0000FFFF
	li	$t2, 0x00000001
	add	$t3, $t1, $t2

	# Add a negative number
	li	$t1, 0xFFFFFFFF		# -1, most positive bit IS set, therefore negative
	li	$t2, 0x00000002		# 2
	add	$t3, $t1, $t2		# t3 = 2 - 1

	# Add two negative numbers
	li	$t1, 0xFFFFFFFC		# -4
	li	$t2, 0xFFFFFFFD		# -3
	add	$t3, $t1, $t2		# t3 = -4 - 3



	# Exit the program
	li	$v0, 10
	syscall