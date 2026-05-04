.data
save_0: .word 10 #0x10010000
save_1: .word 10 #0x10010004
save_2: .word 10 #0x10010008
save_3: .word 10 #0x1001000C
save_4: .word 5 #0x10010010

.text
addi $s3,$zero,0	#$s3 = i = 0
lui $s6,0x1001		#$s6 = 0x10010000
addi $s5,$zero,10	#$s5 = k = 10

loop:   sll $t1,$s3,2	#$t1 = i * 4
	add $t1,$t1,$s6 #$t1=&save[i]
	lw $t2, 0($t1)  #$t2=save[i]
	bne $t2,$s5,Exit #se save[i] != K : Exit
	addi $s3,$s3,1	#$s3 = i++
	j loop
Exit: addi $s7,$zero,0	#fim do programa