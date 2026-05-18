.data
a: .word 3
b: .word 2
c: .word 6

.text
lui $t0,0x1001
lw $s0, 0($t0)
lw $s1, 4($t0)
lw $s2, 8($t0)
addi $s3, $zero, 1

# a meidana
slt $t1, $s0, $s1
slt $t2, $s2, $s0
and $t3, $t1, $t2
beq $t3, $s3, amediana

# b mediana
slt $t1, $s1, $s2
slt $t2, $s0, $s1
and $t3, $t1, $t2
beq $t3, $s3, bmediana

# C mediana
slt $t1, $s3, $s1
slt $t2, $s2, $s3
and $t3, $t1, $t2
beq $t3, $s3, cmediana

amediana:
    sw $s0, 12($t0)
    j Fim

bmediana:
    sw $s1, 12($t0)
    j Fim

cmediana:
    sw $s2, 12($t0)
    j Fim

Fim:






