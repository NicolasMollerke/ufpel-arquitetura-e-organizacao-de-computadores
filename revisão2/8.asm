# 2. Escreva um programa que altere uma string para â€œcapitalizarâ€? a primeira letra de cada
# palavra. Por exemplo, a entrada
# .data
# string: .asciiz "meu professor Ã© muito bom"
# deve produzir a string
# "Meu Professor Ã‰ Muito Bom"
# Assuma que a entrada possui apenas espaÃ§os e letras minÃºsculas. Pode haver mais de
# um espaÃ§o entre as palavras.
# A resposta deve ser a string de entrada modificada, e nÃ£o uma nova string na
# memÃ³ria, ou seja, iniciando no endereÃ§o de memÃ³ria 0x10010000.

.data
    .addr 0x10010000
string: .asciiz "meu professor eh muito bom" # "eh" sem acento

.text

la $t0, string        # $t0=end.base = 0x10010000
li $t1, 1             # $t1=flag

loop:
    lbu $t2, 0($t0)       
    beq $t2, $zero, fim  

    li $t3, 32            
    beq $t2, $t3, espaco

    beq $t1, $zero, proximo

    addi $t2, $t2, -32   
    sb $t2, 0($t0)       
    li $t1, 0       
    j proximo

espaco:
    li $t1, 1            

proximo:
    addi $t0, $t0, 1      
    j loop

fim:
    li $v0, 10
