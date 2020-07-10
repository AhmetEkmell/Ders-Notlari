.data


.text

	# Bu soruda 10000000H adresli dizide 10 sayinin tanımlı oldugu
	# dusunulerek yapildi.

	main:
	
		addi $t0,$zero,0x10000000  # dizi baslangic adresi
		addi $t1,$zero,0x10005000 # sayi > 0 ise dizisi
		addi $t2,$zero,0x10006000 # sayi < 0 ise dizisi
		addi $s0,$zero,0          # dizi indeksi i = 0
		addi $s1,$zero,10		  # dizi uzunlugu = 10 
		
		
	dongu:
			bgt $s0,$s1,exit  # eger i > diziUzunluk ise exit e git
			sll $t1,$s0,2     # i * 4
			add $t2,$t1,$t0   # dizi[i] adresi geldi
			lw $t3,0($t2)     # dizimizin elemanlari sirasiyla t3 registerine gelecek.
			
			bltz $t3,kucukSayilar  # $t5 < 0 ise etikete git
			bgtz $t3,buyukSayilar  # $t5 > 0 ise etikete git
			
		buyukSayilar:
			sll $t4,$s0,2    # t4 = i*4
			add $t4,$t4,$t1  # t4 = buyukSayilar[i] adresi
			sw $t3,0($t4)    # t3 de bulunan sayi 0 dan buyuk oldugundan t4 registerinde yer alan dizi adresimize sayı taşınıyor.
			addi $s0,$s0,1   # indeks++ yani i++
			j dongu          # dongu ye sartsiz dallan
		
		
		kucukSayilar:
			
			sll $t5,$s0,2   # t5 = i*4
			add $t5,$t5,$t2 # t5 = kucukSayilar[i] adresi
			sw $t3,0($t5)   # t3 de bulunan sayi 0 dan buyuk oldugundan t5 registerinde yer alan dizi adresimize sayı taşınıyor.
			addi $s0,$s0,1  # indeks++ yani i++
			j dongu         # dongu ye sartsiz dallan
		
		
		exit:
		
			li $v0,10   # programı sonlandır.
			syscall
		