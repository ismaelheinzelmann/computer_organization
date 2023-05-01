
.text
	APP_LOOP:li $a0, 1
	jal GET_BIT_MASK
	




GET_BIT_MASK:
	blt $a0, $zero, APP_LOOP
	bgt $a0, 31 ,APP_LOOP
	li $t0, 1
	li $t1, 0

BIT_LOOP:beq $t1, $a0, END_BIT_MASK
	mul $t0, $t0, 2
	addi $t1, $t1, 1
	j BIT_LOOP

END_BIT_MASK: 
	move $v0, $t0
	jr $ra
	