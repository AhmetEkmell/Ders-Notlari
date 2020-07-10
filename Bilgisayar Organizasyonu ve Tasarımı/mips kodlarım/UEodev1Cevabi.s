.data
    dizi: .word 1000
.text

	subProcedure:
		addi $sp,$sp,-8  # s registerlerini kullandigim icin
		sw   $s0,4($sp)  # yedekleme islemi yaptim
		sw   $s1,0($sp)
		
		lw   $s0,dizi($zero) # s0 = 10000000H adres
		addi $s1,$zero,0 # sonuc = 0
		addi $t0,$zero,1 # i = 1
		addi $t1,$zero,0 # siradaki = 0
		addi $s2,$zero,10 # uzunluk = 10
	
	forDongusu:
		sll $t3,$t0,2 # i*4
		add $t5,$t3,$s0 # t5 = dizi[i] nin adresi
		lw  $t6,0($t5)  # t6 = dizi[i] elemani var.
		add $t1,$t1,$t6 # siradaki = dizi[0] 
		
		blt $t0,$s2,kontrol # i < uzunluk ise kontrole git.
		j exit
		
	kontrol:
		blt $t1,$t6,esit  # siradaki < dizi[i] ise esit etiketine git
		j exit   # eger dizi sirali degilse zaten exit e gidecek ve sonuc = 0 yazacak.
	esit:
		addi $s1,$s1,1  # sonuc = 1 yapiliyor
		j forDongusu    # tekrar dizi kontrolu icin donguye giriliyor
	exit:
		
		add $v0,$zero,$s1  # sonuc degerimiz hangi degere yani 1 veya 0 a sahipsa o deger return ediliyor.
		lw  $s1,4($sp)
		lw  $s0,0($sp)    # stack eski haline getiriliyor.
		addi $sp,$sp,8
		jr $ra				# ana programda kaldigin yer+4. satira git.
		