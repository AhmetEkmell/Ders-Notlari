.data

	Array: .space 16 # dizi icin 16 Byte yer ayirdik.
	altSatir: .asciiz "\n"
	mesaj: .asciiz "Istanbul"

.text

	main:
	
		addi $s0,$zero,1
		addi $s1,$zero,4
		addi $s2,$zero,5
		addi $s3,$zero,3
		
		addi $t0,$zero,0 # index = 0
		
		# Array adli dizimize verilerimiz ekleniyor ve her eklemeden sonra index+4 yapiliyor. 
		sw $s0,Array($t0)
			addi $t0,$t0,4
		sw $s1,Array($t0)
			addi $t0,$t0,4
		sw $s2,Array($t0)
			addi $t0,$t0,4
		sw $s3,Array($t0)
		
		addi $t0,$zero,0 # index sifirlandi tekrar kullanacagim cunku.
		
		While:
			beq $t0,16,exit
			
			lw $t1,Array($t0) # dizinin her index in de yer alan veriler hafizadan getiriliyor.
			addi $t0,$t0,4 # index i burada kullaniyorum.
			
			li $v0,1 
			move $a0,$t1 # dizi elemani ekrana yazdiriliyor
			syscall
			
			li $v0,4  
			la $a0,altSatir
			syscall
			
			j While
			
		
		exit:
			li $v0,4
			la $a0,mesaj
			syscall
			
			li $v0,10  # program sonlandi.
			syscall
			
			