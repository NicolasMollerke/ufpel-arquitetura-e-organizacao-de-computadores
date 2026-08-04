.data
vetor1: .space 20
vetor2: .space 20
saida: .space 40
str0: .asciiz "Digite elemento vetor 1: "
str1: .asciiz "Digite elemento vetor 2: "

.text

la $s0, vetor1	#endereco do vetor1
la $s1, vetor2 	#endereco do vetor2
li $s3, 0 	#contador = i = 0

loop:
	slti $k0, $s3, 5	#enquanto o nosso i for menor q 5, $k0 = 1 senao $k0 = 0
	beq $k0, $zero, sair 	#se for maior q 5, vou p fim
	la $a0, str0	#endereco da str0
	li $v0, 4	#imprimir string
	syscall
	
	li $v0, 5	#ler inteiro
	syscall
	sw $v0, 0($s0)	#guardo no vetor[i]
	
	la $a0, str1 	#endereco da str1
	li $v0, 4	#imprimir string
	syscall
	
	li $v0, 5 	#ler inteiro
	syscall
	sw $v0, 0($s1)	#guardo no vetor2[i]
	
	addi $s0, $s0, 4	#atualizo o endereco do vetor1 = vetor1++
	addi $s1, $s1, 4	#atualizo o endereco do vetor2 = vetor2++
	addi $s3, $s3, 1	#i++
	
	j loop
	
sair:	
	li $s3, 0	#i = 0
	la $s0, vetor1	#$s0 = endereco vetor1[0]
	la $s1, vetor2	#s1 = endereco vetor2[0]
	la $s6, saida	#$s6 = endereco saida
	
loop2:	
	slti $k0, $s3, 5 	#se i < 5
	beq $k0, $zero, fim
	
	lw $s4, 0($s0)	#ler vetor1[i]
	sw $s4, 0($s6)	#escrevo no endereco da saida[i]
	addi $s0, $s0, 4	#incremento endereco vetor1[i]
	addi $s6, $s6, 4	#iincremento endereco saida[i]
	addi $s3, $s3, 1	#i++
	
	j loop2
	
fim:	
	li $s3, 0 	#i = 0
	
loop3:	
	slti $k0, $s3, 5	# se i < 5
	beq $k0, $zero, final
	
	lw $s4, 0($s1)	#ler vetor2[i]
	sw $s4, 0($s6)	#escrever em saida[i]
	
	addi $s1, $s1, 4	#endereco vetor2[i]++
	addi $s6, $s6, 4	#endereco saida[i]++
	addi $s3, $s3, 1	#i++
	
	j loop3
	
final:
	li $s3, 0 	#i = 0
	la $s6, saida	#endereco de saida[0]

loop4:	
	slti $k0, $s3, 10 	#se i < 10
	beq $k0, $zero, acabou
	
	lw $a0, 0($s6)	# ler saida[i]
	li $v0, 1	#imprimir inteiro
	syscall
	
	addi $s3, $s3, 1	#i++
	addi $s6, $s6, 4	#saida++
	
	j loop4
	
	
	
acabou:
	li $v0, 10 	#finalizar programa
	syscall