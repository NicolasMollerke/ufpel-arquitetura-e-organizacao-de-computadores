#1. Faça um programa que calcule a seguinte equação:
#y = 32ab - 3a + 7b - 13
#Utilize endereços de memória para armazenar o valore de a, b e o resultado y. Cada
#valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space
#4). Utilize as três primeiras posições da memória .data para armazenar,
#consecutivamente, a, b e y, iniciando o código com:

.data
a: .word 3
b: .word 5
y: .space 4  #espaço reservado de 4 bytes

.text
lui $t0,0x1001    #reg. base $t0 = 0x10010000
lw $t1,0($t0)     #$t1 = a = 3
lw $t2,4($t0)	  #$t2 = b = 5
addi $s0,$zero,32 #$s0 = 32
addi $s1,$zero,3  #$s1 = 3
addi $s2,$zero,7  #$s2 = 7
addi $s3,$zero,13 #s3 = 13
mult $t1,$t2      #a*b
mflo $t3	  #$t3 = a*b
mult $t3,$s0	  #32*a*b
mflo $t3	  #t3 = 32*a*b

mult $t1,$s1	  #3*a
mflo $t4	  #$t4 = 3*a

mult $s2,$t2	  #7*b
mflo $t5	  #$t5 = 7*b

sub $a0,$t3,$t4   #$a0 = 32ab - 3
sub $a1,$t5,$s3   #$a1 =  7b - 13

add $a2,$a0,$a1

sw $a2,8($t0)	  #


