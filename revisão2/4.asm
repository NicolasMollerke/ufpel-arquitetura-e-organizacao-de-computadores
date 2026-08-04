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

li $t0, 150
li $t1, 230
li $t2, 991

move $a0, $t0
move $a1, $t1
move $a2, $t2

jal soma3n

move $t3, $v0

li $v0, 10
syscall

soma3n: 
    addiu $sp, $sp, -8
    sw $ra, 0($sp)
    sw $a2, 4($sp) #armazena o Z

    jal soma

    move $t3, $v0 #t0 = X + Y
    lw $t4, 4($sp) 
    
    move $a0, $t4
    move $a1, $t3

    jal soma

    lw $ra, 0($sp)
    addiu $sp, $sp, 8

    jr $ra

soma:
    add $v0, $a0, $a1
    jr $ra
