

#Lesson ..:  Bu örnekte kullanıcıdan alınan 10 tane intieger degerden bir dizi olusturulacak ve ekrana dizi 
#			 elemanlarının toplamı yazılacak


#-----------------------------------------------------------
	.data #the global variable field
	
	dizi:	.space	40			#10 tane integer elemanlı bir dizi alanı olustur (int 4 byte böylece toplam alan 40 byte)

	SystemMessage1:	.asciiz	"Bir integer deger giriniz : "
	SystemMessageF:	.asciiz	"Dizi elemanlarinin toplami: "
	
#------------------------------------------------------------	
	.text #the user codes
	
main:
	# dizide  index takibi için bir register kullanalım, t0 olsun mesela, başlangıç değeri 0
	li $t0,0
	
	
Loop:
	li	$v0, 4						# Ekrana text yazmak için
	la	$a0, SystemMessage1			
	syscall
	
	#Girilen değeri al
	li	$v0, 5						
	syscall							
	move $t1, $v0					# Girilen değer t1 de tutulsun
	
	sw		$t1,dizi($t0)			#bu değeri dizinin o anki indeks ofset degerine gore yukle
	addi	$t0,$t0,4				# indeks i 4 arttır (cunku int word uzunlugundadır)
	bne		$t0,40, Loop
	

#Simdi toplayalım
	
	li	$s0,0   # Toplam sonucu s0 'da tutulsun
	li 	$t0,0	# indeksi tekrar 0 a ayarlayalım
	
Loop2:
	lw		$t2,dizi($t0)	#dizinin bu adresteki degerini t2 'ye al
	add		$s0,$s0,$t2
	addi	$t0,$t0,4		# indeks i 4 arttır (cunku int word uzunlugundadır)
	bne		$t0,40, Loop2	# dizi elemanları tamamlanana kadar donguye devam
	
#Sonucu yazdır
	
	li	$v0, 4						# Ekrana text yazmak için
	la	$a0, SystemMessageF			
	syscall
	
	li	 $v0, 1						# Ekrana integer yazmak için
	move $a0, $s0					
	syscall


#--------------------------------------------------------------
	#terminate the main program
	li $v0,10 	# For exit, load 10 decimal into v0 
	syscall 	# Execute the last operation

	
	