.data
N: .word 5
A: .space 4

.text
lui $t0,0x1001		#$t0 = 0x10010000
addi $t1,$zero,0	#$t1 = i = 0
addi $s0,$zero,0	#$s0 = produtorio = 0
lw $s1,0($t0)		#$s1 = n = MEM[0x10010000]
addi $t2, $zero, 2
addi $t5, $zero, 1
addi $s3, $s1, 1

teste:	slt $t7,$t1,$s3	
		beq $t7,$zero,Fim
		div $t1, $t2
		mflo $t3
		add $t4, $s1, $t3
		mult $t5, $t4
		mflo $t5
		addi $t1, $t1, 1
		j teste

Fim:
	sw $t5, 4($t0)

	
