#Escreva um programa que leia um valor x > 0 da memória (posição 0x10010000) e
#calcule o x-ésimo termo da série de Fibonacci:
#1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
#Escreva o x-ésimo termo da série (y) em uma palavra (4 bytes) de memória. O
#resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da
#memória .data. Inicie o código com:

.data
x: .word 7
y: .space 4 

.text
lui $s0, 0x1001      #reg. base $s0 = 0x10010000
lw $t0, 0($s0)       # $t0 = x (lê o valor 7 da memória)

addi $t1, $zero, 1   # $t1 = termo atual = 1
addi $t2, $zero, 0   # $t2 = termo anterior = 0
addi $t3, $zero, 1   # $t3 = contador

loop:
    beq $t3, $t0, Exit  # if i == x, chegamos no termo desejado

    add $t4, $t1, $t2   # $t4 = próximo termo
    add $t2, $zero, $t1 # anterior recebe o atual
    add $t1, $zero, $t4 # atual recebe o novo
    
    addi $t3, $t3, 1    # contador + 1
    j loop

Exit:
    sw $t1, 4($s0)       #  escreve o x-ésimo termo em 0x10010004