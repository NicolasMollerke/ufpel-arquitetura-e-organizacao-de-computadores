

.data
tamanho: .word 12
vetor: .word 4,-2,33,52,1,17,11,7,90,-7,8,-13

.text
lw $t0, tamanho     #$t0=12
la $t1, vetor
li $s0, 0       #pos
li $s1, 0       #neg
li $s2, 0       #soma
li $t3, 0       #cont

loop:   slt $k0, $t3, $t0
        beq $k0, $zero, fim
        lw $t4, 0($t1)
        add $s2, $s2, $t4
        slti $k0, $t4, 0
        beq $k0, $zero, positivo
        add $s1, $s1, $t4
        j pula

positivo:   add $s0, $s0, $t4
    pula:   addi $t3, $t3, 1
            addi $t1, $t1, 4
            j loop
            
fim: nop
        

