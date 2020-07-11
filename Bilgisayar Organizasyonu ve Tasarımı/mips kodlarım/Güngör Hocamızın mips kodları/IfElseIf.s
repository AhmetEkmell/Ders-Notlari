#Firat University the dept. of Computer Engineering 


#Lesson ..: J instruction and if - else if - else

#Explanation : This program check the integer entered, if the number is positive, then it increases another variable "i" by 1.
#			   if the number is negative, then it decreases "i" by 1. If the number is zero, it will multiply "i" by 2
			   # For this, we use jump instruction 

#-----------------------------------------------------------
	.data #the global variable field
	
	SystemMessage1:	.asciiz	"Enter your number  : "
	SystemMessage2:	.asciiz	"The variable i: "
	NextLine:		.asciiz	"\n"
	
	
#------------------------------------------------------------	
	.text #the user codes
	
main:
	li	$s0,20						# Assume that s0 is "i=20"

	li	$v0, 4						# for text printing
	la	$a0, SystemMessage1			# the system message address is sent to a0 paramter register (la = load address)
	syscall
	
	#Get the user input
	li	$v0, 5						# for int reading
	syscall							# the obtained value is stored in v0 again
	move $t0, $v0					# So it could be copied to a temporary register
	
	beq		$t0,0,DBL				# First, check the number entered is zero (WHY?)
	slt		$t1, $t0, $zero			# check if the number is positive
	beq		$t1,0, INC				# positive, i++
	beq 	$t1,1, DEC				# negative, i--

	
PRINT:
	li	$v0, 4						# for text printing
	la	$a0, SystemMessage2			# the system message address is sent to a0 paramter register (la = load address)
	syscall
	
	li	 $v0, 1						# for int printing
	move $a0, $s0					# show the "i"
	syscall
	
	# Let's put a new line
	li	$v0, 4						
	la	$a0, NextLine			
	syscall
	
			
	#--------------------------------------------------------------
		#terminate the main program
		li $v0,10 	# For exit, load 10 decimal into v0 
		syscall 	# Execute the last operation
	#--------------------------------------------------------------

INC : addi	$s0, $s0, 1
	  j PRINT
	  
DEC : addi	$s0, $s0, -1
	  j PRINT
	  
DBL : li	$t2, 2					# In MIPS, there is no "muli" instruction. You can use multi and mflo
	  mult 	$s0,$t2					# zero, i *=2 
	  mflo	$s0						# load the multiplication result into s0 again
	  j PRINT
	
	