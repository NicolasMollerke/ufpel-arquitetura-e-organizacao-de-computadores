# 3. Escreva um programa que calcule o fatorial de um número N inteiro sem sinal, o
# valor N deve ser inicializado no registrador $t0. Para o cálculo do fatorial deve ser
# utilizada uma subrotina recursiva. O resultado final deve ser armazenado em $t1.
# O argumento para a subrotina deve ser passado através do registrador $a0 e o
# resultado da subrotina deve ser retornado através do registrador $v0.

.text

li $t0, 5           #$t0 = N = 5 (exemplo para testar)

move $a0, $t0       #$a0 = argumento para a subrotina ($t0)

jal fatorial        #desvia para fatorial e salva retorno em $ra

move $t1, $v0       #$t1 = armazena o resultado final do fatorial

li $v0, 10          #codigo do syscall para encerrar o programa
syscall             #fim da execucao do programa principal

fatorial:
    addiu $sp, $sp, -8  #ajusta a pilha para salvar 2 registradores
    sw $ra, 4($sp)      #salva o endereco de retorno $ra na pilha
    sw $a0, 0($sp)      #salva o argumento atual $a0 na pilha

    slti $t2, $a0, 2    #$t2 = 1 se $a0 < 2 (caso base 0 ou 1)
    beq $t2, $zero, recursao #se $t2 == 0, pula para a recursao

    li $v0, 1           #$v0 = 1 (resultado do caso base)
    addiu $sp, $sp, 8   #libera o espaco da pilha antes de retornar
    jr $ra              #retorna para a chamada anterior

recursao:
    addiu $a0, $a0, -1  #$a0 = N - 1
    jal fatorial        #chama fatorial(N - 1) recursivamente

    lw $a0, 0($sp)      #restaura o valor original de $a0 (N) da pilha
    lw $ra, 4($sp)      #restaura o endereco de retorno $ra da pilha
    addiu $sp, $sp, 8   #libera o espaco da pilha

    mul $v0, $a0, $v0   #$v0 = N * fatorial(N - 1)
    jr $ra              #retorna para quem chamou