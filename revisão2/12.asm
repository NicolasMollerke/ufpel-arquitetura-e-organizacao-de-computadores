# 3. Escreva um programa que leia uma string de entrada e armazene na memória
# iniciando na posição 0x10010000. Transforme os caracteres maiúsculos de uma
# string em minúsculos e os caracteres minúsculos em maiúsculos.
# Por exemplo, a entrada:
# “ONE RING to rule Them aLL”
# Deve produzir:
# “one ring TO RULE tHEM All”.
# OBS: Use apenas uma string (não use uma string de saída ou uma string auxiliar no
# seu programa). Não esqueça de terminar a string com nulo. Mantenha a string de
# saída na mesma posição da string de entrada.

.data
string: .asciiz "ONE RING to rule Them aLL"

.text
la $t0, string
li $t2, 32

loop:
    lbu $t1, 0($t0)
    beq $t1, $zero, fim

    beq $t1, $t2, espaco

    slti $t3, $t1, 96
    bne $t3, $zero, transformaEmMinuscula

    addi $t1, $t1,-32
    sb $t1, 0($t0)
    addi $t0, $t0, 1

    j loop
espaco:
    addi $t0, $t0, 1
    j loop
transformaEmMinuscula:
    addi $t1, $t1, 32
    sb $t1, 0($t0)
    addi $t0, $t0, 1
    j loop
fim:
    li $t5, 0
    sb $t5, 0($t1)
    li $v0, 10
    syscall

    