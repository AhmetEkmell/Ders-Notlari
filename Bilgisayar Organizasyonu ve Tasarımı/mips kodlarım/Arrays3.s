.data

	Array: .word 2:3 # ekrana 2 sayisini 3 kere yazacagiz
	altSatir: .asciiz "\n"
	mesaj: .asciiz "Elazig"

.text

	main:
	
		addi $t0,$zero,0 # index = 0
		
		While:
			beq $t0,12,exit
			
			lw $t1,Array($t0) # dizinin t0. index in de yer alan veriler hafizadan getiriliyor.
			addi $t0,$t0,4 # index i burada kullaniyorum.
			
			li $v0,1 
			move $a0,$t1 # dizi elemani ekrana yazdiriliyor
			syscall
			
			li $v0,4  
			la $a0,altSatir
			syscall
			
			j While
			
		
		exit:
			li $v0,4
			la $a0,mesaj
			syscall
			
			li $v0,10  # program sonlandi.
			syscall
			
			