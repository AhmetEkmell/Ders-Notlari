.data

	ileti: .asciiz "Merhaba Dunya\n Ahmet Yesilyurt\n"

.text


	main:
	
		jal metot1 # Sartsiz olarak metot1 e dallan 
		
		# klasik toplama işlemi yapılıyor.
		addi $s0,$zero,5  # bu kod satiri PC+4. satir. Metot1 den sonra bu kod satirlari calisacak.
		addi $s1,$zero,10
		add $t0,$s0,$s1
		
		#Ekrana t0 registerinde bulunan degeri yaz
		li $v0,1
		move $a0,$t0 # integer ifadeler de move veya add komutunu kullanabiliriz.
		syscall
		
		# Programi sonlandir
		li $v0,10
		syscall
		
	
	
	metot1:
	
		#Ekrana iletiyi yazdır
		li $v0,4
		la $a0,ileti #string ifadeler de la komutunu kullanıyoruz
		syscall
		
		jr $ra #main metodunda PC+4. satirdan kodlari islemeye devam et.