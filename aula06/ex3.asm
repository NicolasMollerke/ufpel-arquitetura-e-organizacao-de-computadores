# 3. Escreva um programa que leia um vetor de 10 posições (.word) da memória
# (começando na posição 0x10010000) e verifique se o vetor está ou não ordenado.
# Use o registrador $t0 como flag.
# Faça $t0 = 1 se o vetor estiver ordenado e $t0 = 0 caso contrário.

.data
vetor: .word 0,1,2,3,4,5,6,7,8,9

.text
la $t1, vetor
li $t0, 1       #flag
li $t2, 0       #cont

loop:   slti $t3, $t2, 9
        beq $t3, $zero, fim
        
        lw $t4, 0($t1)
        lw $t5, 4($t1)

        slt $t6, $t5, $t4      #$t6=1 se $t5 < $t4 (fora de ordem)
    	bne $t6, $zero, desordenado #se quebrou a regra ($t6==1)

        addi $t1, $t1, 4
        addi $t2, $t2, 1
        j loop
        
desordenado:
    	li $t0, 0
fim: nop



