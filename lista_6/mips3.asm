.data
	INPUT_A: .asciiz "Escreva o primeiro valor para ser calculada a média:\n>"
	INPUT_B: .asciiz "Escreva o segundo valor para ser calculada a média:\n>"
	OUTPUT: .asciiz "A média aritmética é: "
	
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
	
	li $t0, 2
	mtc1 $t0, $f3
	cvt.s.w $f3, $f3
	
	add.s $f1, $f1, $f2
	div.s $f1, $f1, $f3
	mov.s $f12, $f1

	li $v0, 4
	la $a0, OUTPUT
	syscall
	
	li $v0, 2
	syscall