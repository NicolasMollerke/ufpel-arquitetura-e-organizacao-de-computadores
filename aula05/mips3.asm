.data

vetor_0: .word 0 #0x10010000
vetor_1: .word 1 #0x10010004
vetor_2: .word 2 #0x10010008
vetor_3: .word 3 #0x1001000C
vetor_4: .word 4 #0x10010010
vetor_5: .word 5 #0x10010014
vetor_6: .word 6 #0x10010018
vetor_7: .word 7 #0x1001001C

.text
lui $t0,0x1001		#reg. base p/ acessar memoria
addi $t1,$zero,0	#$t1 = i = 0
addi $t2,$zero,2 	#$t2 = 2 cte p/ operações

teste:  slti $t3,$t1,8	#se i < 8 então faça
	beq $t3,$zero,Fim #se $t3 = 0 salta p/ Fim
	div $t1,$t2	#i%2
	mfhi $t4	#$t4 = resto 
	bne $t4,$zero,Impar #se resto != 0 então salta
	sll $t5,$t1,1	#$t5 = i*2
	sll $s0,$t1,2	#$s0 = i*4
	add $s0,$s0,$t0	#$s0 = &vetor[i]
	sw $t5,0($s0)	#vetor[i] = i*2
	j fim_laco
Impar:  sll $s0,$t1,2	#$s0 = i*4
	add $s0,$s0,$t0	#$s0 = &vetor[i]
	lw $t6,0($s0)	#$t6 = vetor[i]
	lw $t7,-4($s0)	#$t7 = vetor[i-1]
	add $t6,$t6,$t7 #$t6 = vetor[i] + vetor[i-1]
	sw $t6,0($s0)	#vetor[i] = vetor[i] + vetor[i-1]
fim_laco: addi $t1,$t1,1 #$t1 = i = i + 1
	  j teste	#volta p/ teste
Fim: addi $s2,$zero,0	#fim do programa


 
