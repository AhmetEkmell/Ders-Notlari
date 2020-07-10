.data


.text


	main:
		# metot da toplama islemi yapacagim icin degerleri a0 ve a1 registerlerinde tutuyorum.
		addi $a0,$zero,50
		addi $a1,$zero,100
	
		jal metot1  # metot1 e sartsiz dallaniyorum.
		
		#Ekrana toplanan sayı yazdırılıyor.
		li 	 $v0,1
		addi $a0,$v1,0
		syscall
		
		#Program sonlanıyor.
		li $v0,10
		syscall
		
	metot1:
		
		add $v1,$a0,$a1 # ana metotdan gonderilen degerler toplandi ve $v1 registeri ile ana metoda gonderildi.
		jr $ra # ana metotda kalinan yer+4. komuta git ve kaldigin yerden devam et.
		