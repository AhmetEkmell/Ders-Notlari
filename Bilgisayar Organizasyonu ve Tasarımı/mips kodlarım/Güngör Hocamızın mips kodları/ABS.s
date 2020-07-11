#Firat University the dept. of Computer Engineering 


#Lesson ..: Example of multiplication without using the multiplication operator "*". (For the 32-bits results)

# Remark: Note that the numbers entered are positive or negative, because it will affect the result
#		  As you guess, we will use addition operation and a loop

#		  Don' use stack for the saved register (for this question, there is no need)

#-----------------------------------------------------------
	.data #the global variable field
	
	#For text printing
	SystemMessage1:	.asciiz	"Enter the  number : "
	SystemMessageF:	.asciiz	"The answer  : "
	NextLine:		.ascii	"\n"
	
	
#------------------------------------------------------------	
	.text #the user codes
	
main:
	
	li	$v0,4					
	la	$a0,SystemMessage1		
	syscall
	
	
	li	$v0,5					
	syscall
	move $t0, $v0				

	slt	$t7, $t0, $zero
	beq	$t7, 1, CH			# negatif ise CH ye dallan ve pozitif yap
	j 	PRINT				# zaten positif ise sadece ekrana yaz
	
	
CH:		sub  $t0,$zero,$t0
		#veya 	
		# nor		$t0,$t0,0
		# addi	$t0,$t0,1
	
PRINT:	
	li	$v0, 4
	la	$a0, SystemMessageF
	syscall
	
	
	li		$v0, 1		
	move 	$a0, $t0	
	syscall

	#--------------------------------------------------------------
	#terminate the main program
	li $v0,10 	# For exit, load 10 decimal into v0 
	syscall 	# Execute the last operation
	#--------------------------------------------------------------




	
	