# ================================================
# Template: Definindo segmentos de dados e c?digo.
# ================================================
# -----------------------------------------------
# Implementando: C = A + B
#------------------------------------------------

.data
	A: .word 25 #store word 25 in binary on the first address of data
	B: .word 10 #store word 10 in binary on the second address of data (first address plus 4 byte)
	C: .word 0 #store word 0 in binary on the third address of data (first address plust 8 byte)
		
.text
principal:
	la	$s0, A #load address of A variable in memory
	la	$s1, B #load address of B variable in memory
	la	$s2, C #load address of C variable in memory
	
	lw	$t0, 0($s0) #load value stored in the address in $s0, which is the value of A, to the temporary register $t0
	lw	$t1, 0($s1) #load value stored in the address in $s1, which is the value of B, to the temporary register $t1
	add	$s3, $t0, $t1 #adds the value in the register $t0 to the value in the register $t1, and stores it in the register $s3
	sw	$s3, 0($s2) #stores the value in $s3 to the memory address stored in %s2, which is the address of C

	#done with less instructions, using the memory imediate
	la $a0, A
	lw $t0, 0($s0)
	lw $t1, 4($s0)
	add $s1, $t0, $t1
	sw $s1, 8($s0)
	
