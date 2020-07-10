.data

	ileti: .asciiz "Sayilar esit"
	ileti2: .asciiz "Sayilar esit degil"

.text

	main: 
		addi $t0,$zero,5
		addi $t1,$zero,-5
		
		beq $t0,$t1,esit       #t0==t1 ise esit etiketine git
		bne $t0,$t1,esitDegil  #t0!=t1 ise esitDegil etiketine git
		
	esit:
		li $v0,4  # ekrana ileti etiketinde yer alan stringi yaz
		la $a0,ileti
		syscall
		j exit
		
	esitDegil:
		li $v0,4  # ekrana ileti2 etiketinde yer alan stringi yaz
		la $a0,ileti2
		syscall
		j exit
	
	exit:
		li $v0,10  # programi sonlandir.
		syscall