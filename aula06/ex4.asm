# 4. Escreva um programa que inverta a ordem dos elementos de um vetor (.word) com 5
# posições. Por exemplo, a entrada: 1, 2, 3, 4, 5 deve produzir 5, 4, 3, 2, 1.
# A resposta deve ser o vetor de entrada modificado, e não um novo vetor na memória,
# ou seja, iniciando no endereço de memória 0x10010000.

.data
vetor: .word 1,2,3,4,5

.text
la $t1, vetor

lw $t2, 0($t1)
lw $t3, 16($t1)

move $t4, $t2

sb $t3, 0($t1)
sb $t4, 16($t1)

lw $t2, 4($t1)
lw $t3, 12($t1)

move $t4, $t2

sb $t3, 4($t1)
sb $t4, 12($t1)
