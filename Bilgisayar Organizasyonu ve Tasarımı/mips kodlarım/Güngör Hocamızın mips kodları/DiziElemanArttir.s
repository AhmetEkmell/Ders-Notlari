

#Lesson ..:  Bu örnekte kullanıcıdan alınan 10 tane intieger degerden bir dizi olusturulacak ve her bir elemanı
#			 bir arttiran bir alt program cagrilacak donuste bu dizi ekrana yazdirilacak


#-----------------------------------------------------------
	.data #the global variable field
	
	dizi:	.space	40			#10 tane integer elemanlı bir dizi alanı olustur (int 4 byte böylece toplam alan 40 byte)

	SystemMessage1:	.asciiz	"Bir integer deger giriniz : "
	SystemMessageF:	.asciiz	"Dizinin son hali: "
	
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
	

# Her bir elemanı bir arttiracak sub procedure cagir. Parametre dizinin baslangic adresi ve dizi uzunlugudur
# donus degeri v1 den alinacak ancak burada her hangi bir donus degeri kullanılmayacak bu nedenle onu kaydetmeye 
# gerek yok

	la		$a0, dizi
	li		$a1, 40
	jal		OPR
	
	la		$a2, dizi		# yazma alt programı a0 'ı başka bir iş için kullanıyor o yüzden a2 ve a3 ü kullanalim
	li		$a3, 40				# dizi boyutu a3 'e
	jal		YAZ

#--------------------------------------------------------------
	#terminate the main program
	li $v0,10 	# For exit, load 10 decimal into v0 
	syscall 	# Execute the last operation

	
	
	
OPR:
	# bu sub procedure s0 saved register 'ini kullanacak bu nedenle onun önceki degerini
	# stack da saklayın
	addi	$sp, $sp, -4	# 32 bit veri için yer aç
	sw		$s0, 0($sp)		# eski degeri stack de saklayın
	
	li $t0, 0 				#indeksi tekrar 0 'a set edelim
Loop2:
	add		$t1, $a0,$t0	# dizinin baslangic adresine offseti ekle
	lw		$s0, 0($t1)		# dizinin bu adresteki degerini s0 'ye al
	addi	$s0, $s0,1		# bu degeri 1 arttir
	sw		$s0, 0($t1)		# arttirilan bu degeri tekrar aynı hafiza alanina yaz
	addi	$t0, $t0,4		# indeks i 4 arttır (cunku int word uzunlugundadır)
	bne		$t0, $a1, Loop2	# dizi elemanları tamamlanana kadar donguye devam (a1=40 idi)
	
	lw		$s0, 0($sp)		# cikmadan tekrar s0 'ı eski degerine set edelim
	addi	$sp, $sp, -4	# Acilan alani tekrar kapat
		
	jr $ra
	
	
	
	
YAZ:
	# Simdi dizinin son halini gorelim. Bu alt prosedür bunu consol a yazdiracak
	# bu herhangi bir saved register kullanmıyor o nedenle stack 'i kullanmaya gerek yok
	
		
	
	li	$v0, 4						# text yaz
	la	$a0, SystemMessageF			
	syscall
	
	
	li $t0, 0 				#indeksi tekrar 0 'a set edelim
Loop3:
	add		$t2, $a2,$t0	# dizinin baslangic adresine offseti ekle
	lw		$t1, 0($t2)		# dizinin bu adresteki degerini t1 'ye al

	li	 $v0, 1						# int yaz
	move $a0, $t1					# yazilacak degeri gonder
	syscall

	addi	$t0, $t0,4		# indeks i 4 arttır (cunku int word uzunlugundadır)
	bne		$t0, $a3, Loop3	# dizi elemanları tamamlanana kadar donguye devam (a1=40 idi)
	
	jr $ra
	
	
	

	




	
	