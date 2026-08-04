# 6. Escreva um programa que repetidamente pergunte ao usuário pelo número de
# quilômetros viajados e litros de gasolina consumidos e depois imprima o número de
# quilômetros por litro. Para sair do programa, o usuário deve digitar 0 como número
# de quilômetros.
# Armazene todos os números de quilômetros por litro na memória, iniciando pelo
# endereço 0x10010000.
# Exemplo:
# Entrada Saída
# 40
# 3 13 -- 13 também deve ser armazenado em 0x10010000
# 60
# 5 12 -- 12 também deve ser armazenado em 0x10010004
# 0 -- Sai do programa

.data
resultados: .word 0

.text
la $t0, resultados

loop:   li $v0, 5
        syscall

        move $t1, $v0 # $t1 = km
        beq $t1, $zero, fim

        li $v0, 5
        syscall

        move $t2, $v0 # $t2 = L

        div $t1, $t2
        mflo $t3

        move $a0, $t3
        li $v0, 1
        syscall

        sw $t3, 0($t0)
        addi $t0, $t0, 4

        li $a0, 10            #ASCII para nova linha ('\n')
        li $v0, 11            #syscall para imprimir caractere
        syscall

        j loop
fim:
