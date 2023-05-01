.data
	INPUT_A: .asciiz "Escreva o valor de A:\n>"
	INPUT_B: .asciiz "Escreva o valor de B:\n>"
	OUTPUT: .asciiz "A raíz da equação Ax+B é: "
	
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
	
	jal ROOTS
	
	li $v0, 4
	la $a0, OUTPUT
	syscall
	
	li $v0, 2
	syscall
	
	li $v0, 10
	syscall

ROOTS:
	mtc1 $zero, $f5
	cvt.s.w $f5, $f5
	sub.s $f2, $f5, $f2
	div.s $f2, $f2, $f1
	mov.s $f12, $f2
	jr $ra
