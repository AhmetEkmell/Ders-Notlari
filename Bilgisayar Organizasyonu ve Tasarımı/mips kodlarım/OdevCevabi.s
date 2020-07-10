.data


.text

	main:
		
		addi $a0,$zero,5 # n = 5
		
		jal subFunction # şartsız alt programa dallan
		
		#program sonlandırma komutu
		li $v0,10
		syscall
		
		
	subFunction:
		
		addi $sp,$sp,-4
		sw   $a0,($sp)
		
		addi $s1,$zero,0 # toplam = 0
		add  $s2,$zero,$a0     # i = n yani i = 5 
		
		dongu:
			bltz $s2,exit    # i<0 mı? değilse bir alt satırdan devam et
			add $s1,$s1,$s2  # toplam = toplam + i
			addi $s2,$s2,-1  # i--
		
			j dongu
			
		exit:
		
			add $v0,$zero,$s1 # return toplam
			lw $a0,($sp)
			addi $sp,$sp,4
			jr $ra
		
		