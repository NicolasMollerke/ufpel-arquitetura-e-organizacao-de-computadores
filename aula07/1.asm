.data
string: .asciiz "Hello World!\n"

.text
li $v0, 4
la $a0, string
syscall

li $v0, 5  #fim do programa
syscall

move $a0, $v0
li $v0
syscall