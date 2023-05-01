.data
	INPUT: .asciiz "Insira um texto de até 7 digitos:\n>"
	TEXT: .byte

.text
	li $v0, 4
	la $a0, INPUT
	syscall
	
	la $a0, TEXT
	li $v0, 8
	li $a1, 7
	syscall
	