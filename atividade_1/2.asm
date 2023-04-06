#Ismael Coral Hoepers Heinzelmann - 22100625
.data
	C: .word 0
	FRASE_INPUT_B: .asciiz "Digite o valor de B: "
	FRASE_INPUT_D: .asciiz "Digite o valor de D: "
	FRASE_INPUT_E: .asciiz "Digite o valor de E: "
	FRASE_OUTPUT: .asciiz "O resultado da operação é: "
	
.text
principal:
	la $s2, C
	lw $t2, 0($s2)
	
	#INPUT b,d,e
	
	#PRINT FRASE_INPUT_B
	la $a0, FRASE_INPUT_B
	li $v0, 4
	syscall
	
	#INPUT INT
	li $v0, 5
	syscall
	move $t1, $v0
	
	#PRINT FRASE_INPUT_D
	la $a0, FRASE_INPUT_D
	li $v0, 4
	syscall
	
	#INPUT INT
	li $v0, 5
	syscall
	move $t3, $v0
	
	#PRINT FRASE_INPUT_E
	la $a0, FRASE_INPUT_E
	li $v0, 4
	syscall
	
	#INPUT INT
	li $v0, 5
	syscall
	move $t4, $v0			
						
	addi $t0, $t1, 35
	sub $t7, $t3, $t0
	add $t2, $t7, $t4
	
	sw $t2, 0($s2)
	
	#PRINT FRASE_OUTPUT
	la $a0, FRASE_OUTPUT
	li $v0, 4
	syscall
	
	#PRINT RESULTADO
	move $a0, $t2 
	li $v0, 1
	syscall
