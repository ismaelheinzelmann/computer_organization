.data
	PI: .float 3.141592653589793
	INPUT: .asciiz "Digite o raio do círculo para cálculo de área:\n>"
	OUTPUT: .asciiz "A área do cículo é: "

.text
	li $v0, 4
	la $a0, INPUT
	syscall
	
	li $v0, 6
	syscall
	mul.s $f0, $f0, $f0
	la $t0, PI
	l.s $f1, ($t0)
	mul.s $f12, $f0, $f1

	
	li $v0, 4
	la $a0, OUTPUT
	syscall
	
	li $v0, 2
	syscall

		