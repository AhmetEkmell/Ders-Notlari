.data

	yeniSatir: .asciiz "\n"

.text

	main:
		addi $s0,$zero,40 #s0 da 40 var
		
		jal metot1 # metot1 e sartsiz dallan
		
		li $v0,4  # \n ile alta satira yazdirma
		la $a0,yeniSatir
		syscall
		
		li $v0,1  #main metodundaki s0 degeri yani 40 ekrana yazdiriliyor.
		move $a0,$s0
		syscall
		
		li $v0,10 # program sonlandirildi.
		syscall
		
		
	
	metot1:
		
		addi $sp,$sp,-4 # main metodun da s0 registeri kullanıldığı için 40 degerini kaybetmemeliyiz. Dolayisiyla stackde yedekleriz.
		sw  $s0,0($sp)
		
		addi $s0,$s0,60 # s0 registeri 40+60 islemi ile 100 degerini alıyor.
		
		li $v0,1  # s0 registeri yani 100 degeri ekrana yazdiriliyor.
		move $a0,$s0
		syscall
		
		lw $s0,0($sp)   # metotdan cikmadan evvel stack eski durumuna getiriliyor.
		addi $sp,$sp,4
		
		jr $ra   # main metodun da pc+4 den devam et.