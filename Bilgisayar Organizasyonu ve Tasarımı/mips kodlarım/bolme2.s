.data

.text

	main:
		
		addi $t0,$zero,30
		addi $t1,$zero,8
		
		div $t0,$t1
		
		mflo $s0 #sonuc kaydedildi = 3
		mfhi $s1 #bolumunden kalan kaydediliyor = 6
		
		#ekrana yazdirma
		li $v0,1
		move $a0,$s1
		syscall