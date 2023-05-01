.data
	A: .space 800 #8 bytes = 2 words
	
.text
	li $s0, 10
	jal INIT
	
INIT:
	la $t0, A
	li $t1, 0 #i
	li $t2, 0 #j
	
I_LOOP: bgt $t1, $s0, END_INIT
	
J_LOOP: beq $t2, $s0, END_J
	
	mtc1 $t1, $f0
	mtc1 $t2, $f2
	cvt.d.w $f0, $f0
	cvt.d.w $f2, $f2
	add.d $f0, $f0, $f2
	
	mul $t3, $t1, $s0
	mul $t3, $t3, 8
	mul $t4, $t2, 8
	add $t3, $t3, $t4
	add $t3, $t3, $t0
	
	sdc1 $f0, ($t3)
	addi $t2, $t2, 1
	
	j J_LOOP
	
END_J:	addi $t1, $t1, 1
	li $t2, 0
	j I_LOOP

END_INIT:
	
