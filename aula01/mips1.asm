.text #identifica um segmento de memoria p/ instruções
addi $t0,$zero,5 #$t0=5
addi $t1,$zero,10 #t1=10
add  $t2,$t1,$t0 #$t2=$t1t0
add  $t2,$t1,$t0
sub  $t3,$t2,$t1
mult $t0,$t1 #$t0*$t1 = 5*10 = 50
mflo $t4 #t4 recebe a multiplicação
div $t4, $t0
mflo $t5
mfhi $t6
sra $t7, $t5, 2 #move 2bits para direita
