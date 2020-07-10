.data

	liste: .word 'a','b','g','c','c','f'
	char: .byte 'c'
	size: .word 6
	ileti: .asciiz "\nprogram sonlandi"
	temp: .byte 'z'
.text

	main:
		
		jal subFunction
		
		li $v0,4
		la $a0,ileti
		syscall
		
		j exit
		
	
	subFunction:
		
		la $t0,liste # t3 registerine list in adresi geldi.
		lw $t1,size # dizi boyutu hafizan geldi.
		lb $t2,char # kontrolu yapilacak karakter hafizadan getirildi.
		
		li $t7,0 # count yani return 0
		li $t3,0 # i = 0
		
		
		loop:
			
			bge $t3,$t1,donguden_cik  # i > size(dizi boyutu)
			sll $t4,$t3,2   # i * 4
			addu $t4,$t4,$t0 # t4 = list[i] adresi geldi.
			lw  $t6,0($t4)  # t6 = list[i] oldu.
			
			add $s2,$t6,$zero  # dizi elemanlarini gecici bir diziye atiyorum.
			sb  $s2,temp
			
			bne  $t6,$t2,loop_skip  # list[i] != c ise loop_skip e git.
			addi $t7,$t7,1  # count++
			add  $v0,$t7,$zero # return count
			
		loop_skip:
			addi $t3,$t3,1  # i++
			li $v0,4   # dizi elemanlari ekrana yazdiriyorum.
			la $a0,temp
			syscall
			j loop
		
		donguden_cik:
			jr $ra          # main de kaldigin yere git.
		
	
	exit:
			li $v0,10  # programi sonlandir
			syscall
	
	
		