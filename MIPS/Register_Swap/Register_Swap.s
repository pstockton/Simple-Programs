# Register content swap
#
#

	.data

	.text


	li	$t0, 0x1234	# Load t0 
	li	$t1, 0x5678	# Load t1

	xor	$t0, $t0, $t1 	# t0 = t0 XOR t1 
	xor	$t1, $t0, $t1 	# t1 = t0 XOR t1
	xor	$t0, $t0, $t1 	# t0 = t0 XOR t1 = the swap


	li	$v0, 10
	syscall

