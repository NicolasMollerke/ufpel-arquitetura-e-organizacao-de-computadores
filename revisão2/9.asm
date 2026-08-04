# Escreva um programa que leia um vetor de 10 posições (.word) da memória
# (começando na posição 0x10010000) e verifique se o vetor está ou não ordenado.
# Use o registrador $t0 como flag.
# Faça $t0 = 1 se o vetor estiver ordenado e $t0 = 0 caso contrário.

.data
vetor: .word 1,2,3,4,5,6,7,8,11,10

.text
li $t0, 1
la $t1, vetor
li $t4, 0

loop:
    slti $t5, $t4, 9
    beq $t5, $zero, fim
    
    lw $t2, 0($t1)
    lw $t3, 4($t1)

    slt $t5, $t2, $t3
    beq $t5, $zero, desordenado
    
    addi $t1, $t1, 4
    addi $t4, $t4, 1

    j loop
    
desordenado:
    li $t0, 0
    j fim

fim: nop


