.data
	INPUT_A: .asciiz "Escreva o valor de A:\n>"
	INPUT_B: .asciiz "Escreva o valor de B:\n>"
	INPUT_C: .asciiz "Escreva o valor de B:\n>"
	OUTPUT: .asciiz "As raízes da equação Ax+B são: "
	SEPARATOR: .asciiz " "
	
.text
	li $v0, 4
	la $a0, INPUT_A
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	li $v0, 4
	la $a0, INPUT_B
	syscall
	
	li $v0, 6
	syscall
	mov.s $f2, $f0
	
	li $v0, 4
	la $a0, INPUT_C
	syscall
	
	li $v0, 6
	syscall
	mov.s $f3, $f0
	
	jal ROOTS
	
	li $v0, 4
	la $a0, OUTPUT
	syscall
	
	mtc1 $a0, $f12
	li $v0, 2
	syscall

	li $v0, 4
	la $a0, SEPARATOR
	syscall
	
	mtc1 $a1, $f12
	li $v0, 2
	syscall
			
	li $v0, 10
	syscall

ROOTS:
	# c/a
	# -b/a
	div.s $f4, $f3, $f1
	mtc1 $zero, $f5
	sub.s $f5, $f5, $f2
	div.s $f5, $f5, $f1
	mfc1 $a0, $f4
	mfc1 $a1, $f5
	
	jr $ra
