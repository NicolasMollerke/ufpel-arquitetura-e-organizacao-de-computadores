# 4. Escreva um programa que conte com três subrotinas capazes de calcular a área da
# circunferência (π*r^2), do triângulo (b*a/2) e do retângulo (b*a). Inicialmente,
# pergunte ao usuário (use syscall) qual forma geométrica ele deseja (armazenando no
# registrador $t0) e depois solicite as medidas necessárias para calcular a área de cada
# forma (armazenar para circunferência o valor r em $t0, triângulo e retângulo
# armazenar valor de a e b em $t0 e $t1, respectivamente). Ao final, imprima a área
# desejada. Respeite as convenções de uso dos registradores.

.text

li $v0, 5
syscall

move $t0, $v0

li $t7, 1
li $t8, 2
li $t9, 3

beq $t0, $t7, circunferencia
beq $t0, $t8, triangulo
beq $t0, $t9, retangulo

circunferencia:
    li $v0, 5
    syscall

    move $t0, $v0
    move $a0, $t0

    jal area_circunferencia

triangulo:
    li $v0, 5
    syscall

    move $t0, $v0
    
    li $v0, 5
    syscall

    move $t1, $v0

    move $a0, $t0
    move $a1, $t1

    jal area_triangulo

retangulo:
    li $v0, 5
    syscall

    move $t0, $v0
    
    li $v0, 5
    syscall

    move $t1, $v0

    move $a0, $t0
    move $a1, $t1

    jal area_retangulo


area_circunferencia:
    li $t1, 3

    mult $a0, $t1
    mflo $t2

    li $t4, 2

    mult $t2, $t4
    mflo $t3

    move $v0, $t3

    jal imprime

area_triangulo:
    li $t4, 2

    mult $a0, $a1
    mflo $t2

    div $t2, $t4
    mflo $t3

    move $v0, $t3

    jal imprime

area_retangulo:
    mult $a0, $a1
    mflo $t2

    move $v0, $t2

    jal imprime

imprime:
    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 10
    syscall
