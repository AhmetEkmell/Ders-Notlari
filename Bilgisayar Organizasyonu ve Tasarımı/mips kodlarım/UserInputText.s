.data

	ileti: .asciiz "Merhaba, "
	ileti2: .asciiz "Lutfen adini girer misin => "
	username: .space 20 # kullanici adi icin girilecek karakter sayisi
	
.text

	main:
		
		li $v0,4 # Ekrana ileti2 yer alan string yazdirildi
		la $a0,ileti2
		syscall
		
		li $v0,8 # kullanicinin string bir veri girisi yapilmasi saglaniyor
		la $a0,username
		li $a1,20
		syscall
		
		li $v0,4 # Ekrana ileti de yer alan string yazdirildi.
		la $a0,ileti
		syscall
		
		li $v0,4 # Ekrana kullanicic giris yaptigi string yazdiriliyor.
		la $a0,username
		syscall
		
		j exit # exit etiketine dallaniyoruz.
		
	
	exit:
	
		li $v0,10
		syscall  # program sonlandi.
		
		