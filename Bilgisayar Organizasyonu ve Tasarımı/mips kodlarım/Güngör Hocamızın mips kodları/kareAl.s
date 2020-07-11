		.data
			hdr: .ascii "Bir sayinin karasini alma\n"	#ilk basta kullaniciya verilecek ascii mesaj
				 .asciiz "Deger girin: "
				 
			ansMsg: .asciiz "Sonuc: "			#sonuc ta yazdirilacak mesajı yazdirma ascii etiket
			
			value: .word 0				#sonucun saklanacagi hafiza bolumu
# -----------------------------------------------------

		.text

main:
	#konsola mesaj yaz
	li $v0, 4 
	la $a0, hdr 
	syscall 
	
	#konsoldan deger oku
	li $v0, 5 
	syscall 

	#sayinin karesini al ve sonucu t0 da tut
	mul $t0, $v0, $v0 
	
	#sonuc degerini hafizada ayrilan alana yaz
	sw $t0, value 
	
	#Konsola ascii yaz
	li $v0, 4 
	la $a0, ansMsg 
	syscall 
	
	#Konsola integer yaz
	li $v0, 1 
	lw $a0, value 
	syscall 
	
	# Programi bitir
	li $v0, 10 
	syscall 




