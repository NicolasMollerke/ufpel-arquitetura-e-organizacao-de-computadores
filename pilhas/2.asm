# 2. Escreva um programa equivalente ao código C abaixo com o assembly do MIPS.
# Assim como no exemplo em C, utilize duas subrotinas (soma3n e soma). Armazene
# os valores em $t0, $t1, $t2 e $t3, para X, Y, Z e R, respectivamente.
# main(){
# int X=150;
# int Y=230;
# int Z=991;
# int R=0;
# R = soma3n(X, Y, Z);
# }
# int soma3n(int n1, int n2, int n3){
# return( soma(n3, soma(n1, n2)));
# }
# int soma(int A, int B){
# return( A+B );
# }

.text

li $t0, 150         #$t0 = X = 150
li $t1, 230         #$t1 = Y = 230
li $t2, 991         #$t2 = Z = 991
li $t3, 0           #$t3 = R = 0

move $a0, $t0       #1o argumento de soma3n = X
move $a1, $t1       #2o argumento de soma3n = Y
move $a2, $t2       #3o argumento de soma3n = Z

jal soma3n          #desvia para soma3n e salva retorno em $ra

move $t3, $v0       #$t3 = R = retorno de soma3n ($v0)

li $v0, 10          #codigo do syscall para encerrar o programa
syscall             #fim da execucao do programa principal

soma3n:
    addiu $sp, $sp, -8  #ajusta a pilha para salvar 2 registradores
    sw $ra, 4($sp)      #salva o endereco de retorno original da main
    sw $s0, 0($sp)      #salva $s0 na pilha para usa-lo com seguranca

    move $s0, $a2       #$s0 = guarda n3 temporariamente

    jal soma            #chama soma(n1, n2) pois $a0 e $a1 ja estao certos
    
    move $a0, $s0       #1o argumento da nova soma = n3
    move $a1, $v0       #2o argumento da nova soma = resultado de soma(n1, n2)

    jal soma            #chama soma(n3, soma(n1, n2))

    lw $s0, 0($sp)      #restaura o valor original de $s0
    lw $ra, 4($sp)      #restaura o endereco de retorno para a main
    addiu $sp, $sp, 8   #libera o espaco da pilha

    jr $ra              #retorna para o programa principal

soma:
    add $v0, $a0, $a1   #$v0 = A + B
    jr $ra              #retorna para quem chamou a funcao soma