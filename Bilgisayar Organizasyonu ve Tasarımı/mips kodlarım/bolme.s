.data

.text

	main:
		
		addi $t0,$zero,4  #t0 = 4
		addi $t1,$zero,20 #t1 = 20
		
		div $t3,$t1,$t0 # t3 = t1/t0 => t3 = 20/4
		
		#ekrana yazdirma
		li $v0,1
		add $a0,$zero,$t3
		syscall