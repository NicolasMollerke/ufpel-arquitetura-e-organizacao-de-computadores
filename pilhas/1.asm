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
# 39 44

.text

li $v0, 5           #codigo do syscall para ler inteiro
syscall
move $t0, $v0       #$t0 = 1o valor lido

li $v0, 5           #codigo do syscall para ler inteiro
syscall
move $t1, $v0       #$t1 = 2o valor lido

li $v0, 5           #codigo do syscall para ler inteiro
syscall
move $t2, $v0       #$t2 = 3o valor lido

move $a0, $t0       #$a0 = 1o argumento = $t0
move $a1, $t1       #$a1 = 2o argumento = $t1
move $a2, $t2       #$a2 = 3o argumento = $t2

jal calcular_media  #desvia para calcular_media e salva retorno em $ra

move $t5, $v0       #$t5 = retorno da media ($v0)

li $v0, 1           #codigo do syscall para imprimir inteiro
move $a0, $t5       #$a0 = valor a ser impresso ($t5)
syscall

li $v0, 10          #codigo do syscall para executar o encerramento do programa
syscall             #fim da execucao do programa principal

calcular_media:
    add $t0, $a0, $a1   #$t0 = $a0 + $a1
    add $t0, $t0, $a2   #$t0 = $t0 + $a2

    li $t1, 3           #$t1 = 3 (divisor)
    div $t0, $t1        #divide $t0 por $t1
    mflo $v0            #$v0 = quociente da divisao

    jr $ra              #retorna para o chamador