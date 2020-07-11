
			    ######### $v0'a atanacak değerler ########
					#							    #					
#				 Konsola Yazma		    Konsoldan Deger Alma
#	Integer			1								5
#	Float			2								6
#	Double			3								7
#	Text		  	4								8
#-----------------------------------------------------------
	.data #the global variable field
	
	SystemMessage1:	.asciiz	"Bir integer deger giriniz : "
	SystemMessageF:	.asciiz	"Dizi elemanlarinin toplami: "
	

#------------------------------------------------------------	
	.text #the user codes


main:
	li $t0,0x10010050
	li $t8,0

#deger al	
Loop:
	li	$v0, 4						
	la	$a0, SystemMessage1			
	syscall
	
	
	li	$v0, 5						
	syscall							
	move $t1, $v0					
	
	sw		$t1,0($t0) 			
	addi    $t8,1
	addi	$t0,$t0,4				
	bne		$t8,10, Loop

#topla	
	li $t0,0x10010050
	li $t8,0
	add $s0,$zero,$zero
	
	Loop2:
	lw		$t2,0($t0)	
	add		$s0,$s0,$t2
	addi    $t8,1
	addi	$t0,$t0,4		
	bne		$t8,10, Loop2	
	
#Sonucu yazdır
	
	li	$v0, 4						
	la	$a0, SystemMessageF			
	syscall
	
	li	 $v0, 1						
	move $a0, $s0					
	syscall
	
	
bitir:	
#--------------------------------------------------------------
	#terminate the main program
	li $v0,10 	# For exit, load 10 decimal into v0 
	syscall 	# Execute the last operation
