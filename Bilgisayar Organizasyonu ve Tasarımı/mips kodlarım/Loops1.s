.data

	ileti: .asciiz "\nDongu Sonlandi"
	virgul: .asciiz ","

.text

	main:
	
		addi $t0,$zero,0 	 # i = 0
		
		
		While:
			bgt $t0,10,Exit  # i>10 ise exit e git
			jal printNum	 # sartsiz etikete dallan
			
			addi $t0,$t0,1   # i = i + 1
			j While	 		 # jump while
		
		
		printNum:
			li $v0,1		# Ekrana sayiyi yaz
			move $a0,$t0
			syscall
			
			li $v0,4		# Sayilar arasina virgul koyuluyor
			la $a0,virgul
			syscall
			jr $ra			# while da kaldigin yer+4 e git.
		
		Exit:
		
			li $v0,4		# Ekrana ileti de yer alan stringi yaz
			la $a0,ileti
			syscall
			
			li $v0,10 		# Programı sonlandir.
			syscall
			
			
			