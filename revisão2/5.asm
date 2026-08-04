# 3. Escreva um programa que calcule o fatorial de um número N inteiro sem sinal, o
# valor N deve ser inicializado no registrador $t0. Para o cálculo do fatorial deve ser
# utilizada uma subrotina recursiva. O resultado final deve ser armazenado em $t1.
# O argumento para a subrotina deve ser passado através do registrador $a0 e o
# resultado da subrotina deve ser retornado através do registrador $v0.

.text

li $t0, 4

move $a0, $t0

jal fatorial


fatorial:
    beq $t0, $zero, jal 

    move $t1, $a0

    addi $t1, -1

    mult $t1, $a0
    
    jr $ra