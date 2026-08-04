# 1. Escreva um programa que remova os espaços de uma string. Por exemplo, a entrada
# .data
# string: .asciiz “Gosto muito do meu professor de AOC-I."
# deve produzir a string
# "GostomuitodomeuprofessordeAOC-I.“
# Use apenas uma string (não use uma string de saída ou uma string auxiliar no seu
# programa). Não esqueça de terminar sua string com nulo (ver tabela ASCII para
# código do espaço e do \0 (null)).
# A resposta deve ser a string de entrada modificada, e não uma nova string na
# memória, ou seja, iniciando no endereço de memória 0x10010000.

.data
string: .asciiz "Gosto muito do meu professor de AOC-I."

.text

la $t0, string #ponteiro de leitura
la $t1, string #ponteiro de escrita

loop:
    lbu $t2, 0($t0)
    beq $t2, $zero, fim

    li $t3, 32
    beq $t2, $t3, espaco

    sb $t2, 0($t1)

    addi $t0, $t0, 1
    addi $t1, $t1, 1

    j loop

espaco:
    addi $t0, $t0, 1
    j loop

fim:
    li $t5, 0
    sb $t5, 0($t1)



