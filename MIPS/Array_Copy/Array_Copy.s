# Copy Contents of One Array into Another
#

.data

.word 0,1,2,3,4,5,6,7,8,9,10,11

.text

lui $a0,0x1001 #Base address of source

lui $a1,0x1001 #Base address of destination

ori $a1,0x0030



addi $a2,$0,0 #i=0

addi $a3,$0,12# Loop maximum

loop: beq $a2,$a3,end #Branch out of loop if i=12
      
	#Pull of the stack
      
	lw $t1,0($a0)
      
	#Push to stack destination
      
	sw $t1,0($a1)
      
	addi $a2,$a2,1 # i++
      
	addi $a0,$a0,4 # increment PC+4 for the source address
      
	addi $a1,$a1,4 # increment PC+4 for the destination adress
      
	j loop

end: