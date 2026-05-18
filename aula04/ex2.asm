#Escreva um programa que calcule:
#1 + 2 + 3 + … + 333
#Escreva o resultado (y) em uma palavra (4 bytes) de memória. O resultado deve ser
#armazenado, obrigatoriamente, na posição 0x10010000 da memória .data. Inicie o
#código com:

.data
y: .space 4

.text
lui $s0,0x1001		#reg. base $s0 = 0x10010000
lhu $t0,0($s0)		#$t0 = MEM[0x10010000]

addi $t0, $zero, 0      # $t0 = i = 0
addi $t1, $zero, 0	# $t1 = soma
Loop: 
	add $t1, $t1, $t0  # SOMA = SOMA + i
	addi $t0, $t0, 1   # i = i + 1
	
    	slti $t2, $t0, 334 # if i < 334 , $t2 = 1
    	bne $t2, $zero, Loop # if $t2 != 0 (é verdadeiro), volta para o Loop
Exit:
	sw $t1, 0($s0)	#salva o resultado no reg.