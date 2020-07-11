.data

sayilar: .word 15,20,10,40,-1
alt: .asciiz "\n"

.text 

main:
	
	la $t0, sayilar

d1:	lw $t1,($t0)
	addi $t0,$t0,4
	bltz $t1, exit
	li $v0,1
	move $a0,$t1
	syscall
	
	li $v0,4
	la $a0,alt
	syscall
	
	j d1
	
	exit:
		li $v0,10
		syscall
	
	