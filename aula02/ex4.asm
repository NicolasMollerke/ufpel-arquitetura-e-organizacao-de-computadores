#Escreva a sequ�ncia 0x12345678 em $t1. A seguir, escreva um
#c�digo que inverta a sequ�ncia, escrevendo 0x87654321 em $t2.
#Obviamente o c�digo deve inverter os bits de $t1 e n�o
#simplesmente escrever 0x87654321 diretamente em $t2.

.text

ori $t1, $zero, 0x1234 #$t1 = 0x1234  #ori só coloca até 4 digitos (16 bits)
sll $t1, $t1, 16 #$t1 = 0x12340000
ori $t1, $t1, 0x5678 #$ti = 0x12345678

andi $t4, $t1, 0xF #$t4 = 0x00000008
add $t2, $zero, $t4 #$t2 = 0x00000008
srl $t1, $t1, 4 #$t1 = 0x01234567

sll $t2, $t2, 4 #$t2 =  0x00000080
andi $t4, $t1, 0xF # t4 = 0x00000007
or $t2, $t2, $t4 #$t2 = 0x00000087
srl $t1, $t1, 4 #$t1 = 0x00123456

sll $t2, $t2, 4 #$t2 =  0x00000870
andi $t4, $t1, 0xF # t4 = 0x00000006
or $t2, $t2, $t4 #$t2 = 0x00000876
srl $t1, $t1, 4 #$t1 = 0x00012345

sll $t2, $t2, 4 #$t2 =  0x00008760
andi $t4, $t1, 0xF # t4 = 0x00000005
or $t2, $t2, $t4 #$t2 = 0x00008765
srl $t1, $t1, 4 #$t1 = 0x00001234

sll $t2, $t2, 4 #$t2 =  0x00087650
andi $t4, $t1, 0xF # t4 = 0x00000004
or $t2, $t2, $t4 #$t2 = 0x00087654
srl $t1, $t1, 4 #$t1 = 0x00000123

sll $t2, $t2, 4 #$t2 =  0x00876540
andi $t4, $t1, 0xF # t4 = 0x00000003
or $t2, $t2, $t4 #$t2 = 0x00876543
srl $t1, $t1, 4 #$t1 = 0x00000012

sll $t2, $t2, 4 #$t2 =  0x08765430
andi $t4, $t1, 0xF # t4 = 0x00000002
or $t2, $t2, $t4 #$t2 = 0x08765432
srl $t1, $t1, 4 #$t1 = 0x00000001

sll $t2, $t2, 4 # t2 = 0x87654320
andi $t4, $t1, 0xF # t4 = 0x00000001
or $t2, $t2, $t4 #$t2 = 0x87654321