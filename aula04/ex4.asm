#Uma temperatura, armazenada em $t0, pode ficar em dois intervalos:
#20 ? temp ? 40 e
#60 ? temp ? 80.
#Escreva um programa que coloque uma flag (registrador $t1) para 1 se a
#temperatura está entre os valores permitidos e para 0 caso contrário.
#Inicie o código com a instrução: ori $t0, $zero, temperatura, substituindo
#temperatura por um valor qualquer.

.text
ori $t0,$zero,19
addi $t2, $zero, 1     # $t2 = 1

slti $t2, $t0, 20
bne $t2, $zero, Intervalo2 #se não tiver no intervalo testa no segundo

slti $t2, $t0, 41
bne $t2, $zero, Verdadeiro #se tiver no intervalo vai colocar 1 na flag

Intervalo2:
	slti $t2, $t0, 60
	bne $t2, $zero, Exit #testa no segundo intervalo
	
	slti $t2, $t0, 81
	bne $t2, $zero, Verdadeiro #se estiver dentro vai colocar 1 na flag
	
	j Exit
	
Verdadeiro:
	addi $t1,$zero,1

Exit: 
	addi $v0, $zero, 10 #instrução qualquer para encerrar o programa

