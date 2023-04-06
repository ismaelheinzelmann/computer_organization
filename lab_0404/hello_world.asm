.data
        HELLO: .asciiz "Oi mundo.....!"
.text
main:
	li	$v0, 4			# Comando.
	la	$a0, HELLO		# Carrega string (endere�o).
	syscall 

	
	
	
