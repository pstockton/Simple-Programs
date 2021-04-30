# Find the minimum element within a set of given elements
#


.data

.word 45,56,23,11,1,67,42,9,34,12,11,45

.text



	lui $a0,0x1001 	# Base address of a[0]=0x10010000

	lui $a1,0x1001 	# Base address of a[1]=0x1001

	ori $a1,0x0004 	# a[1]=0x10010004


	
addi $t4,$0,0 	# i=0

	addi $t5,$0,11 	# Loop maximum


While: beq $t4,$t5,end 	# Branch out of loop if i=12

	lw $t1,0($a0)

	lw $t2,0($a1)

	if: bgt   $t1,$t2,else 	# Branch out of loop if t1>t2

        andi $t3,$t1,1          # storing result in register

        j count 	# incrementing count 

else:
 
     andi $t3,$t2,1 	# storing result in register

      j count 		# incrementing count



count:
 
     addi $t4,$t4,1 	# i++

      addi $a0,$a0,4 	# increment PC+4 for the source address

      addi $a1,$a1,4 	# increment PC+4 for the destination adress

      j While


end:
