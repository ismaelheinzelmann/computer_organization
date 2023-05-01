.data
	INPUT: .asciiz "Insira um texto de até 7 digitos para serem contadas as letras 'a' minúsculas :\n>"
	TEXT: .byte 0, 0, 0, 0, 0, 0, 0, 0
	OUTPUT: .asciiz "O texto inserido possui a seguinte quantidade de letras 'a': "

.text
	li $v0, 4
	la $a0, INPUT
	syscall
	
	la $a0, TEXT
	li $v0, 8
	li $a1, 8
	syscall
	
	la $t0, TEXT #TEXT Address
	li $t2, 0 #counter 'a'
	li $t5, 97

WHILE:
	lbu $t1, ($t0)
	addi $t0, $t0, 1
	beq $t1, $zero, ENDWHILE
	bne $t1, $t5, WHILE
	
	addi $t2, $t2, 1
	
	j WHILE
	
ENDWHILE:
	li $v0, 4
	la $a0, OUTPUT
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall