# Bir diktortgenler prizmasinin hacmi ve yüzey alani.

#hacim akenari(en) * bkenari(boy) *ckenari(yukseklik)
#yuzey alani = her bir yuzey alanlarinin toplami yani 2*(a*b + a*c + b*c)

#Her bir kenara ait uzunluklar hafizada (user data segment) da saklansin

	.data
		aSide: .word 73			#hex 0x49
		bSide: .word 14			#hex 0xe
		cSide: .word 16			#hex 0x10
		volume: .word 0			#baslangic deger 0
		surfaceArea: .word 0	#baslangic deger 0
	.text

main:

#Tum islemler registerlar uzerinde olacak hatirlayiniz. Bu nedenle hafizadaki degerleri register 'lara getirelim

		lw $t0, aSide
		#veya 
		#user data segment'de bu koddan once herhangi bir veri yuklenmediginden 0x10010000 (ilk adres) aSide 'ı tutuyor olacaktir. 
		#Boylece soyle de yukleme yapabiliriz
		#li $t8, 0x10010000	#gecici bir register 'a user data sagment 'in ilk adresini yukle
		#lw	$t0,0($t8)
		
		lw $t1, bSide
		lw $t2, cSide
# Simdi bu uc degeri carp ve hacmi bul
		mul $t3, $t0, $t1	#once a*b yi bul ve bunun sonucu ile c yi carp
		mul $t4, $t3, $t2
		sw $t4, volume
# Simdi de yuzey alanini bul
mul $t3, $t0, $t1 	# a*b
mul $t4, $t0, $t2	# a*c
mul $t5, $t1, $t2	# b*c
add $t6, $t3, $t4	# simdi ara toplamlari
add $t7, $t6, $t5	# hesapla ve 
sll	$t7,$t7,1		# 2 ile carp
sw $t7, surfaceArea

#Programi sonlandir
		li $v0, 10 # call code for terminate
		syscall # system call

