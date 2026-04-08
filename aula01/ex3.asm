#Faça um programa que calcule a seguinte equação:
#y = 3x2 - 5x + 13
#Armazene x no registrador $t5 com a instrução addi $t5, $zero, x, substituindo x
#pelo valor desejado, e sempre que precisar o valor de x, utilize o valor armazenado no
#registrador $t5.
#Armazene o resultado y no registrador $t6.
#Faça teste com diferentes valores positivos e negativos de x. 

.text

addi $t2,$zero,3 #$t2 = 3
addi $t3,$zero,-5 #$t3 = -5
addi $t4,$zero,13 #$t4 = 13
addi $t5,$zero,-3 #$t5 = x = -3

mult $t5,$t5 #x2
mflo $s0 #$s0=x2
mult $t2,$s0 #3x2
mflo $s1 #$s1 = 3x2
mult $t3,$t5 #-5x
mflo $s2 #$s2 = -5x

add $s3,$s1,$s2 #$s3 = 3x2 - 5x
add $t6,$s3,$t4 #$t6 = (3x2 - 5x) + 13
