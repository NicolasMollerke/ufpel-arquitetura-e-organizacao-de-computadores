#Faça um programa que some os números decimais 326, -211, 311 e -684
#e escreva o resultado no registrador $t0.

.text

addi $t1,$zero,326 #$t1 = 326
addi $t2,$zero,-211 #$t2 = -211
addi $t3,$zero,311 #$t3 = 311
addi $t4,$zero,-684 #$t4 = -684

add $s0,$t1,$t2 #$s0 = 326 - 211
add $s1,$t3,$t4 #$s1 = 311 - 684
add $t0,$s0,$s1 #$t0 = 115 - 373