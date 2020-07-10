.data

	ileti: .asciiz "Merhaba Ahmet yasini girer misin=> "
	sonuc: .asciiz "\nSenin yasin = "

.text

	main:
		li $v0,4 # ekrana ileti etiketinde yer alan mesaj yazdiriliyor.
		la $a0,ileti
		syscall
		
		li $v0,5 # kullanicidan sayi girisi alindi
		syscall
		
		move $t0,$v0 # t0 registerine kullanicinin verisi kaydedildi.
		
		li $v0,4 # Ekrana sonuc etiketinde yer alan mesaj yazdiriliyor.
		la $a0,sonuc
		syscall
		
		li $v0,1 # Ekrana kullanicinin kaydettigi veri yazdiriliyor.
		move $a0,$t0
		syscall