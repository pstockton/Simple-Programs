#	Encrypt and Decrypt Digits Program
#
#

# Put data here
	.data
		initial_enter: .asciiz " Enter your desired string: \n"
		print_out: .asciiz "\n Your string is encoded to: \n"
		reExecute: .asciiz "\n\n (press any key) Enter next string... (Y) End program:\n"
		endProgram: .asciiz "\n ------------Execution Terminated!------------"
		string_input: .space 64
		reExecute_prompt: .space 3

# Put text here
	.text

	.globl main

# Main function
	main:

	# User input
		li $v0, 4
		la $a0, initial_enter
		syscall

	# Load input
		li $v0, 8
		la $a0, string_input
		li $a1, 64
		syscall
		move $a2, $a0


	# Memory for locations of cases
	# Stores values to associate with inputs
	key:

	# Case value for "0"
		lb $t4, ($a2)
		li $t5 '0'	
		beq $t5, $t4, case0

	# Case value for "1"
		li $t5 '1'	
		beq $t5, $t4, case1
	
	# Case value for "2"
		li $t5 '2'	
		beq $t5, $t4, case2

	# Case value for "3"
		li $t5 '3'	
		beq $t5, $t4, case3
	
	# Case value for "4"
		li $t5 '4'	
		beq $t5, $t4, case4

	# Case value for "5"
		li $t5 '5'	
		beq $t5, $t4, case5

	# Case value for "6"
		li $t5 '6'	
		beq $t5, $t4, case6

	# Case value for "7"
		li $t5 '7'	
		beq $t5, $t4, case7

	# Case value for "8"
		li $t5 '8'	
		beq $t5, $t4, case8

	# Case value for "9"
		li $t5 '9'	
		beq $t5, $t4, case9

	# Branch done
		beq $0, $t4, done
		addi $a2, $a2, 1
		j key



	# Cases
	# These cases are the function calls for the values

	# Case for "0"
	case0:
		li $t1, '4'
		sb $t1, ($a2)
		addi $a2, $a2, 1
		j key	

	# Case for "1"
	case1:
		li $t1, '6'
		sb $t1, ($a2)
		addi $a2, $a2, 1
		j key	

	# Case for "2"
	case2:
		li $t1, '9'
		sb $t1, ($a2)
		addi $a2, $a2, 1
		j key	

	# Case for "3"
	case3:
		li $t1, '5'
		sb $t1, ($a2)
		addi $a2, $a2, 1
		j key	

	# Case for "4"
	case4:
		li $t1, '0'
		sb $t1, ($a2)
		addi $a2, $a2, 1
		j key	

	# Case for "5"
	case5:
		li $t1, '3'
		sb $t1, ($a2)
		addi $a2, $a2, 1
		j key	

	# Case for "6"
	case6:
		li $t1, '1'
		sb $t1, ($a2)
		addi $a2, $a2, 1
		j key	

	# Case for "7"
	case7:
		li $t1, '8'
		sb $t1, ($a2)
		addi $a2, $a2, 1
		j key	

	# Case for "8"
	case8:
		li $t1, '7'
		sb $t1, ($a2)
		addi $a2, $a2, 1
		j key

	# Case for "9"
	case9:
		li $t1, '2'
		sb $t1, ($a2)
		addi $a2, $a2, 1
		j key


	
	# Call when inputs read
	done:

	# Display output
		li $v0, 4
		la $a0, print_out
		syscall

	# Display input string 
		li $v0, 4
		la $a0, string_input
		syscall

	# Print to console
		li $v0, 1
		move $a3, $t1
	 
	# Re-execute program
		li $v0, 4
		la $a0, reExecute
		syscall
		
	# Prompt to re-execute program
		li $v0, 8
		la $a0, reExecute_prompt
		li $a1, 3
		syscall

	# Re-execution input
		lb $a3, ($a0)
		beq $a3, 'y', terminate_program
		beq $a3, 'Y', terminate_program
	
		j main	# Branch back to main

	# Terminate the program
	terminate_program:
		li $v0, 4
		la $a0, endProgram
		syscall	


	# End the program
		li $v0, 10
		syscall
    