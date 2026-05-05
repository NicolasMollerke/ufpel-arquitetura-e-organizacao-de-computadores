#Faça um programa que calcule o seguinte polinômio usando o método de Horner:
#y = - ax4 + bx3 - cx2 + dx - e
#Utilize endereços de memória para armazenar o valor de a, b, c, d, e, x e o resultado
#y. Cada valor deve ocupar 4 bytes na memória (.word), assim como para o resultado
#(.space 4). Utilize as sete primeiras posições da memória .data para armazenar,
#onsecutivamente, a, b, c, d, e, x e y, iniciando o código com:


.data
a: .word -3
b: .word 7
c: .word 5
d: .word -2
e: .word 8
x: .word 4
y: .space 4

.text
lui $t0,0x1001    #reg. base $t0 = 0x10010000
lw $t1,0($t0)     #$t1 = a = -3
lw $t2,4($t0)	  #$t2 = b = 7
lw $t3,8($t0)	  #$t3 = c = 5
lw $t4,12($t0)	  #$t4 = d = -2
lw $t5,16($t0)	  #$t2 = e = 8
lw $t6,20($t0)	  #$t2 = x = 4

sub $t1,$zero,$t1  # $t1 = -a
mult $t1,$t6 #$t1 = -a*x
mflo $s0 #s0 = -a*x
add $s0,$s0,$t2 #$s0 = $s0 + $t2

mult $s0,$t6 #$s0*x
mflo $s1 #$s1 = $s0*x
sub $s1,$s1,$t3 #$s1 = $s1 - 5

mult $s1,$t6 #$s1*$t5
mflo $s2 #s2 = $s1*$t5
add $s2,$s2,$t4 #$s2 = $s2 + -2

mult $s2, $t6 #$s2*$t6
mflo $s3 #$s3 = $s2*$t6
sub $s3,$s3,$t5 #$s3 = $s3 - 8

sw $s3,24($t0)