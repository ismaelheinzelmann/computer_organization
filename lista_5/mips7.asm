.data
	INPUT_OP: .asciiz "Para ativar um bit, digite 1, para desativar um bit, digite 2, para sair, digite qualquer outro valor:\n>"
	INPUT_BIT: .asciiz "Insira o bit a ser operado 31..0:\n>"
	MASK: .word 0
.text
	la $s0, MASK
	
APP_LOOP:
	li $v0, 4
	la $a0, INPUT_OP
	syscall
	
	li $v0, 5
	syscall
	
	beq $v0, 1, TURN_ON
	beq $v0, 2, TURN_OFF
	
	li $v0, 10
	syscall
	
TURN_ON:
	li $v0, 4
	la $a0, INPUT_BIT
	syscall
	li $v0, 5
	syscall
	
	move $a0, $v0
	jal GET_BIT_MASK
	
	lw $t0, ($s0)
	or $t0, $t0, $v0
	sw $t0, ($s0)

	j APP_LOOP
		
TURN_OFF:
	li $v0, 4
	la $a0, INPUT_BIT
	syscall
	li $v0, 5
	syscall
	move $a0, $v0
	jal GET_BIT_MASK
	not $v0, $v0
	
	lw $t0, ($s0)
	and $t0, $t0, $v0
	sw $t0, ($s0)

	j APP_LOOP
	
# Start bit mask
GET_BIT_MASK:
	blt $a0, $zero, APP_LOOP
	bgt $a0, 31 ,APP_LOOP
	li $t0, 1
	li $t1, 0

BIT_LOOP:
	beq $t1, $a0, END_BIT_MASK
	mul $t0, $t0, 2
	addi $t1, $t1, 1
	j BIT_LOOP

END_BIT_MASK: 
	move $v0, $t0
	jr $ra
	
