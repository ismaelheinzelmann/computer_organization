#itoa
.data 
	buffer: .space 16
	
.text

	li $t0, 10
	li $t1, 123
	
	la $t7, buffer
	
	#t1 quotient, t2 remain
loop:	div $t1, $t0
	mflo $t1
	mfhi $t2
	beqz $t2, reverse
	addi $t2, $t2, 48
	sb $t2, ($t7)
	addi $t7, $t7, 1
	j loop

reverse:	
	
		
	