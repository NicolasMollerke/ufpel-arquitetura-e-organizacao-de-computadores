.data
.word 1  #0x10010000
.word -3 #0x10010004
.word 15 #0x10010008
.half 50 #0x1001000C
.word 20 #0x10010010
.byte 15 #0x10010014

.text
lui $t0, 0x1001    #$t0 = 0x10010000
lw $t1,8($t0)	   #$t1 = MEM(0x10010008)
add $s0,$t1,$t1    #$s0 = 30
sw $s0,12($t0)     #MEM(0x1001000C)