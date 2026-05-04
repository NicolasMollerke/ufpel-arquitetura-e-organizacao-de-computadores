.data
a: .half 30	#0x10010000
b: .half 5	#0X10010002
Y: .space 4	#0x10010004

.text
lui $s0,0x1001		#reg. base $s0 = 0x10010000
lhu $t0,0($s0)		#$t0 = MEM[0x10010000]
lhu $t1,2($s0)		#$t1 = MEM[0x10010002]


	beq $t0,$t1,iguais
	div $t0,$t1
	mflo $t3		#$t3 = $t0/$t1
	j fim
iguais: mult $t0,$t1
	mflo $t3		#$t3 = $t0*$t1
fim: sw $t3,4($s0)		#MEM[0x10010004] = $t3
