.data

	dizi:     .word 5,10,15
	uzunluk:  .word 3
	toplam:   .word 0
	ortalama: .word 0
	altSatir: .asciiz "\n"

.text

	main:
	
		la $t0,dizi # dizinin baslangic adresi
		li $t1,0    # i = 0
		lw $t2,uzunluk # t2 = uzunluk
		li $t3,0	   # toplam = 0
		
		diziElemanlariTopla:
			lw $t4, ($t0)   # t4 registerine dizideki elemanlar sirasiyla gelecek.
			add $t3,$t3,$t4 # toplam = toplam + dizi[i] 
			 
			add $t1,$t1,1  # i = i + 1
			add $t0,$t0,4   # Dizinin bir sonraki elemanina erismek icin 4 Byte sonraki kismi goster
			blt $t1,$t2,diziElemanlariTopla  # Eger i < uzunluk ise toplamaya devam et
		
		sw $t3,toplam  # son toplam degeri kaydet.
		
		div $t5,$t3,$t2  # ortalama hesaplaniyor.
		sw  $t5,ortalama # ortalama kaydediliyor.
		
		# toplam sonucu ekrana yazdirildi.
		li $v0,1
		lw $t3,toplam
		move $a0,$t3
		syscall
		
		li $v0,4
		la $a0,altSatir
		syscall
		
		# ortalama sonucu ekrana yazdirildi.
		li $v0,1
		lw $t5,ortalama
		move $a0,$t5
		syscall
		
		li $v0,10
		syscall   # program sonlandi.
	