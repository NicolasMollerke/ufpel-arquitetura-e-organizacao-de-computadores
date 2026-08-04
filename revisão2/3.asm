# 1. Escreva uma subrotina que retorne a média entre três valores. A subrotina deve
# receber como argumentos três inteiros e retornar a média entre eles. Escreva um
# programa para testar a subrotina que leia três valores do usuário e imprima o
# resultado. Importante: Utilize os registradores convencionados para a passagem de
# argumentos e valor de retorno! Armazene o retorno da subrotina (média entre os três
# valores) no registrador $t5.
# Exemplo:
# Entrada Saída
# 51
# 42
# 39 44 -- 44 também deve ser armazenado em $t5

.text

li $v0, 5
syscall
move $a0, $v0

li $v0, 5
syscall
move $a1, $v0

li $v0, 5
syscall
move $a2, $v0

jal media

move $t5, $v0

move $a0, $t5
li $v0, 1
syscall

li $v0, 10
syscall

media:  add $a0, $a0, $a1
        add $a0, $a0, $a2

        li $t0, 3

        div $a0, $t0
        mflo $v0

        jr $ra