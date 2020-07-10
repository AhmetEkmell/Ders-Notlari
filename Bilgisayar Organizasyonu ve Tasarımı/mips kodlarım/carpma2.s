.data


.text

	main:
	
		addi $t0,$zero,4 #t0 = 4
			
		sll $t1,$t0,2    # 2 üzeri 2 = 4 tur. Sebebi 2 basamak t0 sayisini sola dogru kaydiriyoruz. 2^2=4 ile t0 = 4 sayıları carpilıirsa t1 = 16 olur. 
		
		#ekrana yazdirma
		li $v0,1
		move $a0,$t1
		syscall