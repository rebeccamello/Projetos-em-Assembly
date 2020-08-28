# Faça	um programa MIPS que receba como entrada uma string com	n
#caracteres e gere como	saída uma nova	string com a inversão da ordem dos caracteres.	
#Essa nova string também terá a troca das letras maiúsculas por minúsculas e vice-versa.
#Por exemplo: se a entrada for ComPuTadOREs a saída deverá ser SeroDAtUpMOc. A entrada deve 
#ser lida da	memória	e a saída deve ser escrita na memória. Considere que a string só tenha	
#caracteres letras. Lembre-se que o fim	da string é dado pelo caractere	nulo e que para	
#manipular string nessa	questão recomendado que	sejam usadas variáveis do tipo ASCIIZ.	
#Atenção: os caracteres	deverão	ser armazenados	em sequência na	memória. Dica: olhem
#a tabela ASCII	e vejam	se ela	é útil	na solução.

#0100 0001 - A

#0110 0001 - a

.data
	Palavra: .asciiz "tEStaNdO" 
	Final: .asciiz "Sua palavra invertida: "
	inverso: .space 256
	
.text

	li $t0, 0          #contador do tamanho da string
	la $t1, Palavra    #guarda o end da letra
	la $t2, inverso    #end da palavra invertida

		
	#DESCOBRIR TAMANHO DA PALAVRA
	loop:
		lb $s0, 0($t1)                #le um bite que ta em $t1
		beq $s0, $zero, subt           #se for 0 é que acabou a string
		add $t0, $t0, 1               #acrescenta 1 no contador
		add $t1, $t1, 1               #passa pro proximo na palavra
		j loop
		
	subt: 	
		sub $t1, $t1, 1
		
	inversao:
		#COMECA A INVERTER
		lb $s0, 0($t1)               #le um bite que ta em $t1
		bge $s0, 'a', vira_mai       #se s0 for maior ou igual a 'a', é minuscula
		add $s0, $s0, 32             #vira minuscula
		sb $s0, 0($t2)               #coloca a maiuscula no vetor final
		add $t2, $t2, 1              #proximo do vetor final
		sub $t1, $t1, 1              #subtrai 1 do vetor da palavra pois ela fica invertida nele originalmente
		sub $t0, $t0, 1              #subtrai do contador 
		bne $t0, $zero, inversao
		j resultado
		
	vira_mai:
		sub $s0, $s0, 32             #vira o valor de maiuscula
		sb $s0, 0($t2)               #coloca a letra no vetor final
		add $t2, $t2, 1              #proximo do vetor final
		sub $t1, $t1, 1              #subtrai 1 do vetor original
		sub $t0, $t0, 1              #subtrai do contador 
		bne $t0, $zero, inversao
		j resultado
		
		
	resultado:
		#IMPRIME A MENSAGEM FINAL
		li $v0, 4
		la $a0, Final
		syscall
		
		#IMPRIMIR O RESULTADO NA TELA		
		li $v0, 4  
		la $a0, inverso    
		syscall
