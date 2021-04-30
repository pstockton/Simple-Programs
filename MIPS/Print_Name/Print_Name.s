# Print Name
#

	.data

	print_string: .asciiz "My name is Stockton, Patrick Stockton"

	.text


	.globl main


	main:

	li 	$v0, 4 			
	la 	$a0, print_string 	# System call code 

	
	# Exit Program
	#li	$v0, 10
	syscall 	 
