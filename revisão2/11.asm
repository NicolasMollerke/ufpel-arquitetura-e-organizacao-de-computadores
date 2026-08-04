# 2. Crie um programa para calcular a soma S de todos os números pares dentre os N
# números informados pelo usuário. Inicialmente, o número N deverá ser lido pelo
# teclado e, logo depois, serão lidos os N valores. Os N valores lidos devem ser
# armazenados na memória. O resultado S da soma de pares deverá ser apresentado na
# tela, assim como a quantidade Q de valores pares.
# Você deve criar uma sub-rotina para a leitura dos valores e uma sub-rotina para
# encontrar e somar os pares.

.data
saida: .word

.text
la $t0, saida

li $v0, 5
syscall

move $t1, $v0

li $t2, 0
li $t6, 0 #cont pares
li $t7, 0 #soma pares

loop:
    slt $t3, $t2, $t1

    beq $t3, $zero, fim

    jal ler_val

    move $t4, $v0
    move $a0, $t4

    move $a1, $t6
    move $a2, $t7

    jal verifica_par

    move $t6, $a1
    move $t7, $a2

    sw $t4, 0($t0)

    addi $t0, $t0, 4
    addi $t2, $t2, 1

    j loop

ler_val:
    li $v0, 5
    syscall
    
    jr $ra
verifica_par:
    li $t5, 2
    div $a0, $t5
    mfhi $t6

    bne $t6, $zero, impar

    addi $a1, $a1, 1

    add $a2, $a2, $a0

    jr $ra
impar:
    jr $ra
fim:
    li $v0, 1
    move $a0, $t6
    syscall

    li $a0, 10            #ASCII para nova linha ('\n')
    li $v0, 11            #syscall para imprimir caractere
    syscall
    
    li $v0, 1
    move $a0, $t7
    syscall
    
    li $v0, 10
    syscall
