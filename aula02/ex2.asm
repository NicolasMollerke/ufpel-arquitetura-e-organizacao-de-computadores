#Escreva 0xAAAAAAAA em $t1. Faça um shift de um bit para a
#direita desse valor e coloque o resultado em $t2, deixando $t1
#inalterado. Em $t3, $t4 e $t5 coloque os resultados das operações
#or, and e xor entre $t1 e $t2, respectivamente. Em comentários
#no final do código, explique os resultados obtidos, mostrando os
#valores binários.

.text

ori $t1,$zero,0xAAAA #$t1=0xAAAA
sll $t1,$t1,16 #$t1=0xAAAA0000
ori $t1,$t1,0xAAAA #$t1=0xAAAAAAAA

srl $t2,$t1,1 #$t2=0x55555555
or $t3,$t1,$t2 #$t3=0xFFFFFFFF (1010) or (0101) = 1111
and $t4,$t1,$t2 #$t3=0x00000000 (1010) or (0101) = 0000
xor $t5,$t1,$t2 #$t3=0xFFFFFFFF (1010) or (0101) = 1111
