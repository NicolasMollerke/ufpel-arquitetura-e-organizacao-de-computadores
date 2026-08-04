.data
resultados: .word 0 

.text

la $t0, resultados 
  
loop:
    li $v0, 5             #syscall para ler inteiro
    syscall               #copia o valor digitado para $v0
    move $t1, $v0         #$t1=quilômetros viajados

    beq $t1, $zero, fim   #se digitou 0 nos quilômetros, sai do programa

    li $v0, 5             #syscall para ler inteiro
    syscall               #valor digitado vai para $v0
    move $t2, $v0         #$t2 litros consumidos

    div $t1, $t2          #divide LO=$t1 / $t2 
    mflo $t3              #$t3 =resultado da divisão

    sw $t3, 0($t0)        #salva o valor de km/l no endereço atual do ponteiro
    addi $t0, $t0, 4      #avança o ponteiro de memória em 4 bytes

    move $a0, $t3         #coloca o resultado em $a0 para o syscall de impressão
    li $v0, 1             #syscall para imprimir inteiro
    syscall
    
    li $a0, 10            #ASCII para nova linha ('\n')
    li $v0, 11            #syscall para imprimir caractere
    syscall

    j loop                

fim:    nop
