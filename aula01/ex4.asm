#Faça um programa que calcule a seguinte equação:
#y = 9x + 7
#2x + 8
#Armazene x em $t1, com a instrução addi $t1, $zero, x, substituindo x pelo valor
#desejado, e sempre que precisar o valor de x, utilize o valor armazenado no
#registrador $t1.
#Armazene o quociente da divisão em $t2 e o resto em $t3.
#esponda o que acontece quando x = -4

.text

addi $t1,$zero,-4 #$t1 = x = -4
addi $t4,$zero,9 #$t4 = 9
addi $t5,$zero,7 #$t5 = 7
addi $t6,$zero,2 #$t6 = 2
addi $t7,$zero,8 #$t1 = 8

mult $t1,$t4 #9x
mflo $s0 #$s0=9x
add $s2,$s0,$t5 #$s2 = 9x + 7
mult $t1,$t6 #2x
mflo $s1 #$s1=2x
add $s3,$s1,$t7 #$s3 = 2x + 8
div $s2,$s3 #(9x + 7)/(2x + 8)
mflo $t2 #$t2 = quociente
mfhi $t3 #$t3 = resto

#o -4 faz com que a divisão tenha denominador 0 o que causa uma exceção no processador
