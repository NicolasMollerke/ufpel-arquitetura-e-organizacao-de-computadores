# 5. Declare tr?s vetores do mesmo tamanho:
# .data
# tamanho: .word 7
# vetor1: .word -30, -23, 56, -43, 72, -18, 71
# vetor2: .word 45, 23, 21, -23, -82, 0, 69
# soma: .word 0, 0, 0, 0, 0, 0, 0
# Inicialize um ponteiro para cada vetor (pseudo-instru??o la) e fa?a a soma dos
# elementos dos vetores 2 a 2.
# O vetor resultante deve ser armazenado depois dos elementos do segundo vetor.
# Exemplo: soma[i] = vetor1[i]+vetor2[i]

.data
tamanho: .word 7
vetor1: .word -30, -23, 56, -43, 72, -18, 71
vetor2: .word 45, 23, 21, -23, -82, 0, 69
soma: .word 0, 0, 0, 0, 0, 0, 0

.text
lw $t0, tamanho     #$t0=12
la $t1, vetor1
la $t2, vetor2
la $t3, soma
li $t4, 0       #cont

loop:   slt $t5, $t4, $t0
        beq $t5, $zero, fim

        lw $s0, 0($t1)
        lw $s1, 0($t2)

        add $s3, $s0, $s1
        sw $s3, 0($t3)

        addi $t1, $t1, 4
        addi $t2, $t2, 4
        addi $t3, $t3, 4
        
        j loop
fim: nop

        
