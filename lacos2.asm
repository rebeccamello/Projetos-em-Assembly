# SOMA DOS ELEMENTOS DE UM VETOR JÁ DETERMINADO

.data
c: .word 3, 0, 1, 2, -6, -2, 4, 10, 3, 7, 8, -9, -15, -20, -87, 0
fim: .asciiz "\nSoma dos elementos = "

#Em C++:
#int c[15] = {3, 0, 1, 2, -6, -2, 4, 10, 3, 7, 8, -9, -15, -20, -87};
#  int i = 0, soma = 0;
#  while (i <= 15){
#    soma = soma + c[i];
#    i++;
#  }
#  cout << "Soma = "<< soma;


.text
	la $s0, c       # colocando o endereço do array em $s0
	li $s1, 15      # s1 guarda o valor de comparacao do while
	li $s2, 0       # s2 é o i que controla a quantidade de vezes que entra no laço
	li $s3, 0       # s3 é a soma


	laco:
	ble $s2, $s1, while
	j resultado

	while:
	lw $t2, 0($s0)       # colocando o elemento do indice i do array em $t2
	add $s3, $s3, $t2
	addiu $s0, $s0, 4    #desloco 4 bytes  
	add $s2, $s2, 1      #acrescenta 1 no i
	j laco


	resultado:
	li $v0, 4 #imprime a msg de fim do programa
	la $a0, fim
	syscall
	
	#IMPRIMIR O RESULTADO NA TELA		
	li $v0, 1    
	move $a0, $s3    #soma
	syscall 

