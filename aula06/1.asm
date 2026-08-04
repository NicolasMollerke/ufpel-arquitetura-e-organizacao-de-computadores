.data
string: .asciiz "Ser ou nao ser?"

.text
li $t0, 0 #$t0=cont=0
la $t1, string #$t1=end.vase = 0x10010000

#funçao strlen
loop:   lbu $t2, 0($t1)   #carregar char
        beq $t2, $zero, fim
        addi $t0, $t0, 1
        addi $t1, $t1, 1

fim:    nop

.data
reserva: .space 120 #10 x 4x3
str0: .asciiz "Digite Km percorrido\n"
str1: .as

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
