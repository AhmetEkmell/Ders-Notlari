.data

	altSatir: .asciiz "\n"

.text

	main:
		addi $s0,$zero,60  # s0 = 60
		
		jal metot  # sartsiz metot a dallan
		
		li $v0,4   # metot da isin bittikten sonra bu satira gel ve \n yap
		la $a0,altSatir
		syscall
		
		jal ekranaYazdirMetodu  # main metodunda ki s0 register degeri yani 60 ı ekrana yazmak için ekranaYazdirMetodu na git.
		
		j exit # programi sonlandirmak için exit etiketine git.
	
	metot:
		addi $sp,$sp,-8  # ic ice procedure kullandigimizdan dolayı ra registerini de yedeklememiz gerekiyor.
		sw   $ra,4($sp)
		sw 	 $s0,0($sp)
		
		addi $s0,$s0,40  # s0 registerine bu metot da 100 degeri atandı.
		
		jal ekranaYazdirMetodu  # belirtilen etikete git ve ekrana bu metodun yani 100 degerini ekrana yaz.
		
		
		lw $s0,0($sp)  # ekrana yazma isleminden sonra stack eski haline getir.
		lw $ra,4($sp)
		addi $sp,$sp,8
		
		jr $ra   # main metodun da kaldığın yerden+4 devam et.
	
	ekranaYazdirMetodu:
	
		li $v0,1  # s0 register degerleri ekrana yazdirma islemi yapiliyor.
		move $a0,$s0
		syscall
		
		jr $ra   # metot isimli etikette kaldigin yerden+4 devam et.
		
	exit:
		li $v0,10 # programı sonlandir. 
		syscall
		
		