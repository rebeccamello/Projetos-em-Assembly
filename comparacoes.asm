.data
#SEGMENTO DO PROGRAMA ONDE DECLARAMOS "VARIAVEIS"
	N1: .asciiz "Digite o 1o numero: "
	N2: .asciiz "Digite o 2o numero: "
	N3: .asciiz "Digite o 3o numero: "
	Maior: .asciiz "\nO maior numero é = "
	Meio: .asciiz "\nO numero do meio é = "
	Menor: .asciiz "\nO menor numero é = "
	
	#reg $s0 - menor
	#reg $s1 - meio
	#reg $s2 - maior

.text
#SEGMENTO DO PROGRAMA QUE CONTEM AS INSTRUCOES 

#  =========== O QUE ESTE PROGRAMA FAZ? ===========

# n1 = int(input("Digite o 1o numero: "))
# n2 = int(input("Digite o 2o numero: "))
# n3 = int(input("Digite o 3o numero: "))
# menor = 0
# meio = 0
# maior = 0

# if n1 < n2:
#   if n1 < n3:
#   	menor = n1)
#	    if n2 < n3:
#		meio = n2
#		meior = n3
#	    else:
#		meio = n3
#		meior = n2		
#   else:
#   	menor = n3
#	meio = n1
#	maior = n2

# else:
#   if n3 < n1:
#	if n2 < n3:
#		menor = n2
#		meio = n3
#		meior = n1
#	else:
#		menor = n3
#		meio = n2
#		meior = n1
#   else:
#   	menor = n2
#	meio = n1
#	meior = n3

#print("O menor numero e =", menor)
#print("O numero do meio e =", meio)
#print("O maior numero e =", maior)


#IMPRIMIR A MSG N1 NA TELA
	li $v0,4
	la $a0,N1
	syscall 

#LER UM INTEIRO DIGITADO PELO USUARIO
	li $v0,5
	syscall

#FAZER UMA COPIA DO DADO LIDO		
	move $t0, $v0

#IMPRIMIR A MSG N2 NA TELA	
	li $v0,4
	la $a0,N2
	syscall 

#LER UM INTEIRO DIGITADO PELO USUARIO		
	li $v0,5
	syscall

#FAZER UMA COPIA DO DADO LIDO		
	move $t1, $v0
	
#IMPRIMIR A MSG N3 NA TELA	
	li $v0,4
	la $a0,N3
	syscall 

#LER UM INTEIRO DIGITADO PELO USUARIO		
	li $v0,5
	syscall

#FAZER UMA COPIA DO DADO LIDO		
	move $t2, $v0

#COMPARANDO OS VALORES LIDOS => if n1 < n2	
	slt $t3,$t0,$t1    # t0 < t1, se SIM, $t2 = 1
	
	beq $t3,$zero,t0_maior_t1
	
	slt $t5, $t0, $t2
	
	beq $t5, $zero, t0_maior_t3
	
	move $s0, $t0     # menor = n1
	slt $t6, $t1, $t2
	
	beq $t6, $zero, t2_menor_t1
	
	move $s1, $t1    # meio = n2
	move $s2, $t2    # maior = n3
	j resposta
	
t0_maior_t1:
	slt $t4, $t2, $t0    #se o n3 < n1 
	beq $t4, $zero, n1_menor_n3
	slt $t7, $t1, $t2
	beq $t7, $zero, t2_menor_t1_2
	move $s0, $t1
	move $s1, $t2
	move $s2, $t0
	j resposta

t0_maior_t3:
	move $s0, $t2   #menor = n3
	move $s1, $t0   #meio = n1
	move $s2, $t1   #maior = n2
	j resposta

t2_menor_t1:
	move $s1, $t2   #meio = n3
	move $s2, $t1   #maior = n2
	j resposta
	
t2_menor_t1_2:
	move $s0, $t2   #menor = n3
	move $s1, $t1   #meio = n2
	move $s2, $t0   #maior = n1
	j resposta

n1_menor_n3:
	move $s0, $t1   #menor = n2
	move $s1, $t0   #meio = n1
	move $s2, $t2   #meior = n3
	j resposta
	

resposta:
#IMPRIMIR A MSG Resposta NA TELA		
	li $v0,4
	la $a0,Menor
	syscall 

#IMPRIMIR O RESULTADO NA TELA		
	li $v0, 1    
	move $a0, $s0    #menor
	syscall 
	
	
#IMPRIMIR A MSG Resposta NA TELA		
	li $v0,4
	la $a0,Meio
	syscall 
	
#IMPRIMIR O RESULTADO NA TELA		
	li $v0, 1    
	move $a0, $s1    #meio
	syscall 
	
#IMPRIMIR A MSG Resposta NA TELA		
	li $v0,4
	la $a0,Maior
	syscall 
	
#IMPRIMIR O RESULTADO NA TELA		
	li $v0, 1    
	move $a0, $s2    #maior
	syscall 