.data

	ileti: .asciiz "kucuktur"
	ileti2: .asciiz "\nbuyuktur"

.text

	main: 
		 addi $t0,$zero,10
		 addi $t1,$zero,20
		
		 slt $s0,$t0,$t1  # t0<t1 ise s0=1 degilse s0=0
		 slt $s1,$t1,$t0  # t1<t0 ise s1=1 degilse s1=0
		
   		 bne $s0,$zero,kucuk # s0 != 0 ise kucuk etiketine git
	
dallan1: beq $s1,$zero,buyuk # s1 == 0 ise buyuk etiketine git
		
	kucuk:
		
		li $v0,4  #ekrana ileti etiketinde yer alan stringi yaz
		la $a0,ileti
		syscall
		j dallan1  # dallan1 etiketine git.
	
	buyuk:
	
		li $v0,4  #ekrana ileti2 etiketinde yer alan stringi yaz
		la $a0,ileti2
		syscall
		j exit   # exit etiketine git.
		
	exit:
	
		li $v0,10
		syscall   # programi sonlandir.
		
		
		