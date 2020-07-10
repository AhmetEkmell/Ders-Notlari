.data

	EkranaSayiGirisi: .asciiz "Lutfen sayi girisi yapiniz => "
	EkranaSonucYaz:   .asciiz "Girilen sayinin faktoriyeli => "
	sayi:	.word 0
	sonuc: 	.word 0

.text
	
	.globl main
	main:
	
		li $v0,4  # Ekranda kullaniciya uyari mesaji veriliyor
		la $a0,EkranaSayiGirisi
		syscall
		
		li $v0,5  # Kullanici bir sayi girisi yapiyor
		syscall
		
		sw $v0,sayi # Kullanicinin girdigi sayi, sayi etiketimize kaydediliyor.
		
		lw $a0,sayi # Daha sonra bu sayiyi kullanmak özere lw komutu ile tekrar hafizadan getirdik.
		jal FaktoriyelHesapla  # girdigimiz sayinin faktoriyelini hesaplama uzere dallaniyoruz.
		sw $v0,sonuc # FaktoriyelHesapla metodunun en son sonucu v0 registeri ile sonuc etiketine kaydediliyor.
		
		li $v0,4   # Ekrana String ifademiz yazdiriliyor.
		la $a0,EkranaSonucYaz
		syscall
		
		li $v0,1  # Ardindan Ekrana kullanicinin girmis oldugu sayinin faktoriyel hesabinin sonucu ekrana yazdiriliyor.
		lw $a0,sonuc
		syscall
		
		li $v0,10
		syscall
	
	#---------------------------------------------
	#Faktoriyel Hesaplama kismi
	
		.globl FaktoriyelHesapla
		FaktoriyelHesapla:
			
			subu $sp,$sp,8   # Stack de ra registeri ve s0 registeri icin yer aciyoruz. Videolu anlatimlarimda bu kisimlari aciklayacagim.
			sw 	 $ra,0($sp)
			sw   $s0,4($sp)
			
			li $v0,1  #simdi kullanici yukarida bir sayi girmisti o sayiyi burada kontrol ediyoruz eger sayimiz 0 a esitse Faktoriyel bitecek.
			beq $a0,0,FaktoriyelBitir
			
			move $s0,$a0 # s0 registerine yukarida girdigimiz sayi atandi.
			
			# burada aslinda yapilan islem su => n * FaktoriyelHesapla(n-1) islemi
			sub  $a0,$a0,1 
			jal FaktoriyelHesapla
			
			mul $v0,$s0,$v0
			
			FaktoriyelBitir:
				
				# son olarak metotdan cikarken stack eski haline geri getiriliyor.
				lw $ra,0($sp)
				lw $s0,4($sp)
				addu $sp,$sp,8
				
				jr $ra  # aslinda carpma islemine buradan gidiliyor stack her eski haline donerken v0 degerlerini carpmak uzere mul komutuna gidiyor
						# ve en son main metodun da nerede kaldiysa oraya gidiyor ve programi sonlandiriyor.
						# bu kisimlari videolu bir sekilde youtube üzerinde anlatacagim ilgilenen arkadaslar Ahmet Yesilyurt isimli kanalimi takip edebilirler.
						
						
					#kanal linki => https://www.youtube.com/channel/UCyWYkM9_-gtdzf0Odd_RY7Q?view_as=subscriber	
					
			
			
			
