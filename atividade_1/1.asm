#Ismael Coral Hoepers Heinzelmann - 22100625
.data
	A: .word 0
	B: .word 10
	C: .word 0
	D: .word 55
	E: .word 5
	
.text
principal:
	la $s0, A
	la $s1, B
	la $s2, C
	la $s3, D
	la $s4, E
	
	lw $t0, 0($s0)
	lw $t1, 0($s1)
	lw $t2, 0($s2)
	lw $t3, 0($s3)
	lw $t4, 0($s4)
	
	addi $t0, $t1, 35
	sub $t7, $t3, $t0
	add $t2, $t7, $t4
	
	sw $t2, 0($s2)

