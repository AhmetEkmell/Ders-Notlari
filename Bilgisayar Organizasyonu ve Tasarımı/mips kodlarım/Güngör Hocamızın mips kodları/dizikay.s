# Not:
# Bu kodalar optimize (min satir ile yapilmis) degildir. 
# Amac temel operasyonlari teker teker gormek oldugundan uzun kodlama yapilmistir  

    .data
		f: .word 10 	#  (ki başlangıçta 0x10010000 dir) data segment adresine 0xa yükle 
		g: .word 55		#  (artık 0x10010004, yani başlangıçtan 4 byte sonra) hafıza adresine 0x37 yükle 
		y: .word 22		#  (artık 0x10010008) hafıza adresine 0x16 yükle 
		z: .word 7		#  (artık 0x1001000c) hafıza adresine 0x7 yükle 
						# böylece kalinan en son adresin (yani 0x100100c) nin 4 byte fazlası olacaktir yani 0x10010010
	.text

main:
	addi 	$s0,$zero,0				#baslangic deger
	addi	$s1,$zero,0 			#baslangic deger ata
	li 		$s1,0x10010000			#user data segment baslangic adresi, artik s1 hep bu baslangic adresini gosterecek
	#veya 
	#lui	$s1,4097     # cunku 4097 hex olarak 1001 e denk gelir
						 # lui bu sayiyi s1 in en değerlikli 32 bitine atar
						 # böylece s1= 10010000 olur yani kullanici data segment başlangici
	
	lw 		$t0,0($s1)	 #hafızada gosterilen ilk elemani en sona eklemek icin t0 'da sakla	
			
etiket: 
	addi 	$s0,$s0,1	#hafizada baslangic adresinden 0, 4, 8 ve 12 byte uzaga gidebilmek icin birer birer artan bir register lazim
	sll 	$s2,$s0,2	#simdi bu degiskeni 4 ile carp ve s1 referans adresine ekleyerek bir sonraki elemanı t2 ye getir 
	add 	$t1,$s2,$s1
	lw 		$t2,0($t1)
	
	sw 		$t2,-4($t1)	#simdi getirilen bu elemani bir önceki adrese yukle (ilk eleman zaten t0 a önceden alinmisti)
	
	slti 	$t3,$s0,3	#en son eleman 12 byte sonra oldugu icin son elemana geldigini anlamak icin artma register 'i 3 olmusmu kontrol et
	beq 	$t3,$zero,exit   #dongu tamam' cik
	
	j etiket	
	
exit: 
	sw $t0,0($t1)		#Simdi saklanan dizinin ilk elmani (t0) en son adrese yukle
	
	li $v0,10
	syscall

