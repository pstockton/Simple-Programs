# Factorial Calculation
#
#

	.data

	N: .word 5 		# Upper number limit 
	factorial: .word 1


	.text 

	.globl main


	main: 

	lw 	$s0, factorial		# Factorial value register
	lw 	$s1, N  		# Multiplication value of the factorial
	li 	$s2, 1			# Stop value of counter

	loop:

	mult 	$s0, $s1		# Multiply the factorial and sequential value
	mflo 	$s0			# Store value
	addi 	$s1, $s1, -1 		# Increment N down by 1
	bne 	$s1, $s2, loop 		# If N is equal to "stop", s2 


	# Exit Program
	li	$v0, 10
	syscall


