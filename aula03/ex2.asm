#2. Faça um programa que calcule o seguinte polinômio usando o método de Horner:
#y = 9a3- 5a2 + 7a + 15
#Utilize endereços de memória para armazenar o valor de a e o resultado y. Cada
#4). Utilize as duas primeiras posições da memória .data para armazenar,
#consecutivamente, a e y, iniciando o código com:

.data
a: .word 3
y: .space 4

.text
lui $t0,0x1001    #reg. base $t0 = 0x10010000
lw $t1,0($t0)     #$t1 = a = 3
addi $s0,$zero,9 #$s0 = 9
addi $s1,$zero,-5 #$s1 = 5
addi $s2,$zero,7 #$s2 = 7
addi $s3,$zero,15 #$s3 = 15

mult $s0,$t1 #$s0x$t1
mflo $t2 #$t2 = $s0x$t1
add $t3,$t2,$s1 #$t3 = $s0x$t1 + -5

mult $t3,$t1 #$t3x$t1
mflo $t4 #$t4 = $t3x$t1
add $t5,$t4,$s2 #$t5 = $t3x$t1 + 7

mult $t5,$t1 #$t5x$t1
mflo $t6 #$t6 = $t5x$t1
add $t7,$t6,$s3 #$t5 = $t3x$t1 + 15

sw $t7,4($t0)