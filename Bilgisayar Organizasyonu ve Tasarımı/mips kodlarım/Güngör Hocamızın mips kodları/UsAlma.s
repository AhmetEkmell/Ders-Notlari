#Firat University the dept. of Computer Engineering 


#Lesson ..: Example of exponentiation (FOR POSITIVE INTEGERS (and for the 32 bits-results ))


#-----------------------------------------------------------
	.data #the global variable field
	
	#For text printing
	SystemMessage1:	.asciiz	"Enter the base integer : "
	SystemMessage2:	.asciiz	"Enter the exponent  : "
	SystemMessageF:	.asciiz	"The answer  : "
	NextLine:		.ascii	"\n"
	
	
#------------------------------------------------------------	
	.text #the user codes
	
main:
	
	# In the program, $t0=the base number,  $t1= the exponent,  $t3= the result
	# we use a sub procedure for the exponentiation operation
	# So we will send t0 and t1 as parameters. For the return value, $v1 register will be used
	
	# The text message that wants the base number to be entered 
	li	$v0,4					# A text message will be written
	la	$a0,SystemMessage1		# ask for the base number
	syscall
	
	# get the base number
	li	$v0,5					# An integer will be read
	syscall
	move $t0, $v0				# The number entered is stored in v0, so this value is copied into another register
	
	
	# The text message that wants the exponent number to be entered 
	li	$v0,4					# A text message will be written
	la	$a0,SystemMessage1		# ask for the exponent number
	syscall
	
	# get the exponent number
	li	$v0,5					# An integer will be read
	syscall
	move $t1, $v0				# The number entered is stored in v0, so this value is copied into another register
	
	
	#Now, let's send the parameters (Remember! a0, a1, a2 and a3 are the parameter registers)
	move	$a0, $t0
	move	$a1, $t1
	
	jal	Exponentiation			# Brunch the sub procedure
	
	move	$t3, $v1			# copy the result into t3 
	
	
	
	# Now, we can print the result 
	# First a an explanation message 
	li	$v0, 4
	la	$a0, SystemMessageF
	syscall
	
	# the result
	li		$v0, 1		# for integer printing
	move 	$a0, $t3	# print the result
	syscall
	
	# Let's put a new line
	li	$v0,4					
	la	$a0,NextLine		
	syscall
	
	
	#--------------------------------------------------------------
	#terminate the main program
	li $v0,10 	# For exit, load 10 decimal into v0 
	syscall 	# Execute the last operation
	#--------------------------------------------------------------
	
	
#Sub-procedure
	Exponentiation:	
		
		# for the exponentiation operation, we will use a loop. This loop will continue  "exponent" times.
		# Remember! a0=base, a1=exponent v1=return value
			
			beq	$a1,0,AA			# if the exponent is zero, the result will be v1=1
			
			move	$v1, $a0		# for the result
			
			beq	$a1,1,BB			# if the exponent is 1, the result will be v1
			
			li	$t4, 1						#for the loop counting
			 
		Loop:
			mul		$v1, $v1, $a0			# multiply the result by itself
			addi	$t4, 1					# increase the loop count
			slt		$t5, $t4, $a1			# if the loop number is greater than the exponent, 
			bne		$t5, 0, Loop			# then exit
			
			
			jr 	$ra						#return
		
		AA:	li	$v1, 1					# if the exponent is zero, the result is 1
		BB:	jr $ra						# return

	
	