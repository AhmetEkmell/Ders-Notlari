#Firat University the dept. of Computer Engineering 


#Lesson ..: Example of multiplication without using the multiplication operator "*". (For the 32-bits results)

# Remark: Note that the numbers entered are positive or negative, because it will affect the result
#		  As you guess, we will use addition operation and a loop

#		  Don' use stack for the saved register (for this question, there is no need)

#-----------------------------------------------------------
	.data #the global variable field
	
	#For text printing
	SystemMessage1:	.asciiz	"Enter the first number : "
	SystemMessage2:	.asciiz	"Enter the second number  : "
	SystemMessageF:	.asciiz	"The answer  : "
	NextLine:		.ascii	"\n"
	
	
#------------------------------------------------------------	
	.text #the user codes
	
main:
	
	# In the program, $t0=the first number,  $t1= the second,  $t3= the result
	# we use a sub procedure for the multiplication operation
	# So we will send t0 and t1 as parameters. For the return value, $v1 register will be used
	
	# The text message that wants the first number to be entered 
	li	$v0,4					# A text message will be written
	la	$a0,SystemMessage1		# ask for the base number
	syscall
	
	# get the first number
	li	$v0,5					# An integer will be read
	syscall
	move $t0, $v0				# The number entered is stored in v0, so this value is copied into another register
	
	
	# The text message that wants the second number to be entered 
	li	$v0,4					# A text message will be written
	la	$a0,SystemMessage2		# ask for the exponent number
	syscall
	
	# get the base number
	li	$v0,5					# An integer will be read
	syscall
	move $t1, $v0				# The number entered is stored in v0, so this value is copied into another register
	
	

	
	
	#Now, let's send the parameters (Remember! a0, a1, a2 and a3 are the parameter registers)
	move	$a0, $t0
	move	$a1, $t1
	
	
	jal	OPR						# Brunch the sub procedure
	
	move	$t3, $v1			# copy the return value into t3
	
	
	#check the sign of the answer
	slt		$t5, $t0, $zero		# check if the first number is negative
	slt		$t6, $t1, $zero		# check if the second number is negative
	
	beq		$t5,$t6,PRINT		# Both is negative or positive, then the result is positive, do not change the sign
	move	$a0, $t3			# If they are not the same, then make the sign of the result negative
	jal SIGN					# change the sign of t3 (the result)

	move	$t3, $v1			# copy the return value into t3

PRINT:	
	
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


	SIGN:
		
		sub 	$v1,$zero,$a0
		jr 		$ra
		
		
	ABS :
		slt	$t7, $a2, $zero
		beq	$t7, 1, CH
		move $v1, $a2
		jr $ra

	CH:	sub  $v1,$zero,$a2	
		jr $ra
	
#Sub-procedure
	OPR:	
		
		# for the  operation, we will use a loop. This loop will continue  "the second number" times.
		# Remember! a0=the first number, a1=the second number v1=return value
			
			# First, let's make the two coming parameters positive (because the sign will be evaluated later)
			# BUT!!! Here in this sub procedure, we will call another sub procedure, that is, a nested sub procedure
			# So we have to keep the $ra register in the stack (For this question saved registers are ignored) 
			
			addi	$sp, $sp, -4	# for only $ra register 
			sw		$ra, 0($sp)		# store the main program return addres
			
			move	$a2, $a0 		#make the first parameter positive
			jal	ABS
			move	$a0, $v1
			
			move	$a2, $a1 		#make the first parameter positive
			jal	ABS
			move	$a1, $v1
			
			lw		$ra, 0($sp)		# Get the main program return address
			addi	$sp, $sp, 4		# Close the stack field created
			
			
			beq	$a0,0,AA			# if the first or second number are zero, the result will be v1=0
			beq	$a1,0,AA
			
			beq	$a0,1,B0			# if the first is 1, the result will be the second
			beq	$a1,1,B1			# if the second is 1, the result will be the first
			
			move $v1, $a0			# for the result
			li	 $t4, 1				#for the loop counting
			
		Loop:
			add		$v1, $v1, $a0			# multiply the result by itself
			addi	$t4, 1					# increase the loop count
			slt 	$t5, $t4, $a1			# if the loop number is greater than the exponent, 
			bne		$t5, 0, Loop			# then exit
			
			
			jr 	$ra						#return
			
		
		AA:	li	$v1, 0					# if the any number is zero, the result is 0
			jr $ra						# return
			
		B0:	move $v1, $a1					# v1= a1
			jr   $ra
			
		B1:	move $v1, $a0					# v1= a0
			jr   $ra

	
	