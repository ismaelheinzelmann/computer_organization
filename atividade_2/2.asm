#Ismael Coral Hoepers Heinzelmann
.data
	A: .word 1, 2, 3, 0, 1, 4, 0, 0, 1 # matriz A
	B: .word 1, -2, 5, 0, 1, -4, 0, 0, 1 # matriz B
	FILENAME: .asciiz "output.txt"
	BREAK_LINE: .asciiz "\n"
	OUTPUT: .space 288
	SPACE: .asciiz " "

.text
	li $s0, 0 # i
	li $s1, 0 # j
	la $s2, A
	la $s3, B
	la $s4, OUTPUT
	la $s5, BREAK_LINE
	la $s6, SPACE
	
	# calculate A i base
L2:	mul $t2, $s0, 12 # t2 = i * 12
	add $t0, $s2, $t2 # t0 = address of first element of A i
	
	# calculate B j base
	mul $t3, $s1, 4 # t3 = j 3* 4
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
	
	# adds of multiplications
	add $t4, $t4, $t5
	add $t4, $t4, $t6
	
	# calculate offset in output and save to $t0
	
	# save ascii to buffer
	li $v0, 34
	move $a0 $t4
	move $a1, $t1 #offset buffer
	li $a2, 10
	syscall	
	
	# j++
	addi $s1, $s1, 1	
	blt $s1, 3, L2
	
	li $s1, 0
	addi $s0, $s0, 1
	blt $s0, 3, L2
	
	

	
	
	
	
	
	
	
	
	
		
	
	
	
	
	
	
	
	
	
	
