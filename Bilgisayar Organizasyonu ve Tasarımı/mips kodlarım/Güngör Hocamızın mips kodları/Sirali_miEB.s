

#Lesson ..:  Bu örnekte hafızada bulunan 10 adet integer sayının büyükten kucuge sirali olup
#			 olmadıgi kontrol edilecektir. Bu sayılar simdilik kolaylık olsun diye data kısmına
#			 teker teker yazılacaktır. Siz bu sayıları değiştirerek kodu kontrol edebilirsiniz	


#-----------------------------------------------------------
	.data #the global variable field
	
	n1:		.word	100
	n2:		.word	90
	n3:		.word	80
	n4:		.word	70
	n5:		.word	60
	n6:		.word	50
	n7:		.word	40
	n8:		.word	30
	n9:		.word	20
	n10:	.word	10
	
	SystemMessageF:	.asciiz	"Dizi buyukten kucuge sirali mi : "
	
#------------------------------------------------------------	
	.text #the user codes
	
main:
	li		$t3,1			# t2 true false sonuç bildirecek. Başlangıçta bu değer true =1
	li		$t2,1			# döngü sayısı için
	
	#Değişkenler word tipi bu nedenle adresler 4 byte arayla artacaktır
	la 		$t0, n1			# dizinin ilk adresini al
	addi	$t1,$t0,4		# bir sonraki elemanın adresi 
Loop:
	lw		$s0,0($t0)		# t0 adresindeki değeri s0 'a getir
	lw		$s1,0($t1)		# t1 adresindeki değeri s1 'e getir
	slt		$s2,$s0,$s1		# s0 s1 'den küçükse s2=1
	beq		$s2,1,FLS		# eğer kucukse False yap ve çık
	addi	$t0,$t0,4		# adresleri 4 arttır
	addi	$t1,$t1,4		# adresleri 4 arttır
	addi	$t2,$t2,1		# değilse döngü sayıcısını bir arttır
	bne		$t2, 10,Loop	# döngü 1 den başladığı ve ikişer ikişer kontrol edildiği için en son 9 'a kadar
	j		EXT				# döngü başarı ile bitmiş ise o zaman t3 değişmeden çık

FLS: 
	li		$t3,0

EXT:
	#Printing the system message
	li	$v0, 4						# for text printing
	la	$a0, SystemMessageF			# the system message address is sent to a0 paramter register (la = load address)
	syscall
	
	#Printing the user input
	li	 $v0, 1						# for int printing
	move $a0, $t3					# the temporary register with the user input is sent to the paramter register (move, not la!)
	syscall
	
	
	
#--------------------------------------------------------------
	#terminate the main program
	li $v0,10 	# For exit, load 10 decimal into v0 
	syscall 	# Execute the last operation

	
	