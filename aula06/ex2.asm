# 2. Escreva um programa que altere uma string para “capitalizar�? a primeira letra de cada
# palavra. Por exemplo, a entrada
# .data
# string: .asciiz "meu professor é muito bom"
# deve produzir a string
# "Meu Professor É Muito Bom"
# Assuma que a entrada possui apenas espaços e letras minúsculas. Pode haver mais de
# um espaço entre as palavras.
# A resposta deve ser a string de entrada modificada, e não uma nova string na
# memória, ou seja, iniciando no endereço de memória 0x10010000.

.data
    .addr 0x10010000
string: .asciiz "meu professor eh muito bom" # "eh" sem acento

.text

la $t0, string        # $t0=end.base = 0x10010000
li $t1, 1             # $t1=flag

loop:
    lbu $t2, 0($t0)       #carrega o caractere atual
    beq $t2, $zero, fim   #se for o fim da string (\0), encerra

    li $t3, 32            #código ASCII do espaço
    beq $t2, $t3, espaco #se for espaço, pula para a lógica de espaço

    beq $t1, $zero, proximo #se flag == 0, não faz nada

    addi $t2, $t2, -32    #-32 transforma em maiscula
    sb $t2, 0($t0)        #sobrescreve na memória com a letra maiúscula
    
    li $t1, 0             #desativa a flag
    j proximo

espaco:
    li $t1, 1             # Ativa a flag! O próximo caractere será uma nova palavra

proximo:
    addi $t0, $t0, 1      # Avança para o próximo byte na memória
    j loop

fim:
    li $v0, 10
