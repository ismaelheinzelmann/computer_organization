#Ismael Coral Hoepers Heinzelmann
.data
	A: .word 1, 2, 3, 0, 1, 4, 0, 0, 1 # matriz A
	B: .word 1, -2, 5, 0, 1, -4, 0, 0, 1 # matriz B
	FOUT: .asciiz "output.txt"
	BREAK_LINE: .asciiz "\n"
	SPACE: .asciiz " "
	BUFF: .space 16
	MINUS: .asciiz  "-"
.text
	li $s0, 0 # i
	li $s1, 0 # j
	la $s2, A
	la $s3, B
	
	li $v0, 13
	la $a0, FOUT
	li $a1, 1
	li $a2, 0
	syscall
	move $s6, $v0 # file descriptor
	
	# calculate A i base
L1:	mul $t2, $s0, 12 # t2 = i * 12
	add $t0, $s2, $t2 # t0 = address of first element of A i
	
	# calculate B j base
	mul $t3, $s1, 4 # t3 = j * 4
	add $t1, $s3, $t3 # t1 = address of first element of B j

	# load line
	lw $t4, 0($t0)
	lw $t5, 4($t0)
	lw $t6, 8($t0)
	
	# load column
	lw $t7, 0($t1)
	lw $t8, 12($t1)
	lw $t9, 24($t1)
	
	# multiplication
	mul $t4, $t4, $t7
	mul $t5, $t5, $t8
	mul $t6, $t6, $t9
	
	# adds de multiplications
	add $t4, $t4, $t5
	add $t4, $t4, $t6
	
	# WRITE IN FILE
	
	# convert word to string
	move $t1, $t4
	la $t6, BUFF
	la $t7, BUFF
	beqz $t1, case_zero
	bltz $t1, case_ltz
	bgtz $t1, case_gtz
	
	
case_ltz:
	li $v0, 15
	move $a0, $s6
	la $a1, MINUS
	li $a2, 1
	syscall	
	abs $t1, $t1
case_gtz:
	li $t0, 10
	div $t1, $t0
	mflo $t1
	mfhi $t2
	addi $t2, $t2, 48
	sb $t2, ($t6)
	addi $t6, $t6, 1
	beqz $t1, done
	j case_gtz
	
case_zero:
	addi $t1, $t1, 48
	sb $t1, ($t6)
	
	li $v0, 15
	move $a0, $s6
	la $a1, BUFF
	li $a2, 1
	syscall	
	
	# j++
done:
	addi $s1, $s1, 1
	move $t0, $t7
	move $t1, $t6
	sub $t6, $t6, $t7
	move $t2, $t6
	# t0 = start ; t1 = end ; t2 = size
	
	addi $t1, $t1, -1 # Set $t1 to point to the last byte of the buffer

reverse_loop:
   	bge $t0, $t1, end
    	lb $t3, ($t0) 
    	lb $t4, ($t1)

    	sb $t4, ($t0) 
    	sb $t3, ($t1)

    	addi $t0, $t0, 1
    	addi $t1, $t1, -1

    	j reverse_loop
end:
	
	li $v0, 15
	move $a0, $s6
	move $a1, $t7
	move $a2, $t6
	syscall
	
	li $v0, 15
	move $a0, $s6
	la $a1, SPACE
	li $a2, 1
	syscall
	
	blt $s1, 3, L1
	
	li $s1, 0
	addi $s0, $s0, 1
	
	li $v0, 15
	move $a0, $s6 
	la $a1, BREAK_LINE
	li $a2, 1
	syscall
	
	blt $s0, 3, L1
	
	li $v0, 16
	move $a0, $s6
	syscall
