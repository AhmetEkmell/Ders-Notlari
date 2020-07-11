

#Lesson ..:  Bu örnekte hafızada array oluşturma yapilacaktir. Dizi değerleri klavyeden alınacaktır


#-----------------------------------------------------------
	.data #the global variable field
	
	dizi:	.space	40			#10 tane integer elemanlı bir dizi alanı olustur (int 4 byte böylece toplam alan 40 byte)

	SystemMessage1:	.asciiz	"Bir integer deger giriniz : "
	
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
	
	

#--------------------------------------------------------------
	#terminate the main program
	li $v0,10 	# For exit, load 10 decimal into v0 
	syscall 	# Execute the last operation

	
	