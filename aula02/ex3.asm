#Comece um programa pela instrução: ori $t1, $zero, 0x01.
#Usando apenas as instruções lógicas do tipo R (dois registradores
#como operandos) or, and e xor e instruções de shift (isto é, sem
#usar outras instruções ori além da inicial e nem instruções nor),
#escreva 0xFFFFFFFF em $t1. Procure usar o menor número de
#instruções possível.

.text

ori $t1,$zero,0x01   #$t1 = 0x00000001
sll $t2,$t1,1        #$t2 = 0x00000002

or  $t1,$t1,$t2      #$t1 = 0x00000003 (2 bits em 1)
sll $t2,$t1,2        #$t2 = 0x0000000C

or  $t1,$t1,$t2      #$t1 = 0x0000000F (4 bits em 1)
sll $t2,$t1,4        #$t2 = 0x000000F0

or  $t1,$t1,$t2      #$t1 = 0x000000FF (8 bits em 1)
sll $t2,$t1,8        #$t2 = 0x0000FF00

or  $t1,$t1,$t2      #$t1 = 0x0000FFFF (16 bits em 1)
sll $t2,$t1,16       #$t2 = 0xFFFF0000

or  $t1,$t1,$t2      #$t1 = 0xFFFFFFFF (32 bits em 1)

