# 4. Escreva um programa que conte com três subrotinas capazes de calcular a área da
# circunferência (π*r^2), do triângulo (b*a/2) e do retângulo (b*a). Inicialmente,
# pergunte ao usuário (use syscall) qual forma geométrica ele deseja (armazenando no
# registrador $t0) e depois solicite as medidas necessárias para calcular a área de cada
# forma (armazenar para circunferência o valor r em $t0, triângulo e retângulo
# armazenar valor de a e b em $t0 e $t1, respectivamente). Ao final, imprima a área
# desejada. Respeite as convenções de uso dos registradores.

.text

li $v0, 5           #codigo do syscall para ler inteiro (opcao do menu)
syscall             
move $t0, $v0       #$t0 = opcao escolhida (1=circulo, 2=triangulo, 3=retangulo)

li $t7, 1           #$t7 = 1 (para comparacao)
beq $t0, $t7, op_circulo #se $t0 == 1, pula para o fluxo do circulo

li $t7, 2           #$t7 = 2 (para comparacao)
beq $t0, $t7, op_triangulo #se $t0 == 2, pula para o fluxo do triangulo

li $t7, 3           #$t7 = 3 (para comparacao)
beq $t0, $t7, op_retangulo #se $t0 == 3, pula para o fluxo do retangulo

li $v0, 10          #codigo do syscall para encerrar (opcao invalida)
syscall             #fim da execucao se a opcao for incorreta

op_circulo:
    li $v0, 5       #codigo do syscall para ler inteiro
    syscall         
    move $t0, $v0   #$t0 = raio (r)

    move $a0, $t0   #$a0 = argumento r para a subrotina
    jal area_circulo #chama a subrotina do circulo
    j imprimir      #pula para a impressao do resultado

op_triangulo:
    li $v0, 5       #codigo do syscall para ler inteiro (medida a)
    syscall         
    move $t0, $v0   #$t0 = altura (a)

    li $v0, 5       #codigo do syscall para ler inteiro (medida b)
    syscall         
    move $t1, $v0   #$t1 = base (b)

    move $a0, $t0   #$a0 = argumento a
    move $a1, $t1   #$a1 = argumento b
    jal area_triangulo #chama a subrotina do triangulo
    j imprimir      #pula para a impressao do resultado

op_retangulo:
    li $v0, 5       #codigo do syscall para ler inteiro (medida a)
    syscall         
    move $t0, $v0   #$t0 = altura (a)

    li $v0, 5       #codigo do syscall para ler inteiro (medida b)
    syscall         
    move $t1, $v0   #$t1 = base (b)

    move $a0, $t0   #$a0 = argumento a
    move $a1, $t1   #$a1 = argumento b
    jal area_retangulo #chama a subrotina do retangulo

imprimir:
    move $t2, $v0   #$t2 = armazena a area retornada em $v0

    li $v0, 1       #codigo do syscall para imprimir inteiro
    move $a0, $t2   #$a0 = valor da area calculada ($t2)
    syscall         

    li $v0, 10      #codigo do syscall para encerrar o programa
    syscall         #fim da execucao do programa principal

area_circulo:
    mul $t0, $a0, $a0   #$t0 = r^2
    li $t1, 3           #$t1 = 3 (aproximacao de pi)
    mul $v0, $t1, $t0   #$v0 = pi * r^2
    jr $ra              #retorna para o chamador

area_triangulo:
    mul $t0, $a0, $a1   #$t0 = b * a
    li $t1, 2           #$t1 = 2 (divisor)
    div $t0, $t1        #divide (b * a) por 2
    mflo $v0            #$v0 = quociente da divisao
    jr $ra              #retorna para o chamador

area_retangulo:
    mul $v0, $a0, $a1   #$v0 = b * a
    jr $ra              #retorna para o chamador