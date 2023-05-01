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
	li $t1, 0 #Garantir o 0 em t1, a digits counter
	li $t2, 0 #Garantir o 0 em t2, loop iteration counter
	li $t5, 97	
FOR:
	lb $t4, ($t0)
	bne $t4, $t5, IT_FOR
	addi $t1, $t1, 1
	
IT_FOR:	addi $t2, $t2, 1
	addi $t0, $t0, 1
	ble $t2, 7, FOR

	li $v0, 4
	la $a0, OUTPUT
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	