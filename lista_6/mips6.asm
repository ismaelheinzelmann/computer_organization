.data
	INPUT: .asciiz "Valor para encontrar a raíz iterativamente:\n>"
	OUTPUT: .asciiz "A raíz encontrada com 20 repetições foi: "
.text
	li $v0, 4
	la $a0, INPUT
	syscall
	
	li $v0, 7
	syscall
	
	jal SQRT_ITER
	
	li $v0, 4
	la $a0, OUTPUT
	syscall
	
	li $v0, 3
	syscall
	
	li $v0, 10
	syscall
	
SQRT_ITER:
	li $t0, 20
	#guess
	li $t1, 1
	mtc1 $t1, $f2
	cvt.d.w $f2, $f2
	
	li $t2, 2
	mtc1 $t2, $f4
	cvt.d.w $f4, $f4
	
INNER: 	beq $t0, $zero, END_ITER
	#guess = ((x/guess) + guess) / 2 -> guess in $f2, x in $f0
	div.d $f10, $f0, $f2
	add.d $f10, $f10, $f2
	div.d $f10, $f10, $f4
	mov.d $f2, $f10
	
	subi $t0 ,$t0 , 1
	j INNER
END_ITER:
	mov.d $f12, $f2
	jr $ra