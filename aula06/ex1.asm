# 1. Escreva um programa que remova os espaços de uma string. Por exemplo, a entrada
# .data
# string: .asciiz “Gosto muito do meu professor de AOC-I."
# deve produzir a string
# " GostomuitodomeuprofessordeAOC-I.“
# Use apenas uma string (não use uma string de saída ou uma string auxiliar no seu
# programa). Não esqueça de terminar sua string com nulo (ver tabela ASCII para
# código do espaço e do \0 (null)).
# A resposta deve ser a string de entrada modificada, e não uma nova string na
# memória, ou seja, iniciando no endereço de memória 0x10010000.

.data
string: .asciiz "Gosto muito do meu professor de AOC-I."

.text
la $t0, string #$t0=end.base = 0x10010000
la $t1, string #$t1=end.base = 0x10010000

loop:   lb $t2, 0($t0)    #carrega o caractere atual no registrador $t2
        beq $t2, $zero, fim #se for o caractere nulo (\0), encerra o loop

        li $t3, 32  #carrega o código ASCII do espaço (32 ou 0x20)
        beq $t2, $t3, espaco #se for espaço, pula a escrita e vai para o próximo

        sb $t2, 0($t1)    #escreve o caractere na posição do ponteiro de escrita
        addi $t1, $t1, 1  #avança o ponteiro de escrita
        addi $t0, $t0, 1  #avança o ponteiro de leitura

        j loop

espaco:
    addi $t0, $t0, 1  #avança o ponteiro de leitura
    j loop         

fim:
    sb $zero, 0($t1)  #garante o fim da string modificada com o caractere nulo (\0)
