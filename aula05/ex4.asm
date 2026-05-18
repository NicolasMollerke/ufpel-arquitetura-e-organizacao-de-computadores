.data

.word 4
.space 4

.text

lui $t0, 0x1001
lw $t1, 0($t0) #$t1 = n
add $t2, $zero, $t1
addi $t3, $zero, 1

Loop: beq  $t2, $t3, Fim

    addi $t2, $t2, -1
    mult	$t2, $t1			
    mflo	$t1
    j Loop

Fim: 
    sw $t1, 4($t0)
    
