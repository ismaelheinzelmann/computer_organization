.data
	INPUT: .asciiz "Insira o valor em Fahrenheit para ser convertido em Celsius:\n>"
	OUTPUT: .asciiz "O valor inserido convertido em celsius é: "
	CONSTANTS: .float 5.0, 9.0, -32.0
.text
	li $v0, 4
	la $a0, INPUT
	syscall
	
	li $v0, 6
	syscall
	mfc1 $a0, $f0
	
	jal F_TO_C
	
	li $v0, 4
	la $a0, OUTPUT
	syscall
	
	li $v0, 2
	syscall
	
	li $v0, 10
	syscall
	
F_TO_C:
	la $t0, CONSTANTS
	l.s $f1, ($t0)
	l.s $f2, 4($t0)
	l.s $f3, 8($t0)
	mtc1 $a0, $f4
	
	div.s $f0, $f1, $f2
	add.s $f4, $f4, $f3
	mul.s $f3, $f0, $f4
	
	mov.s $f12, $f3
	jr $ra