.data

	Array: .space 12 # 12 Byte yer ayırma islemi sanirim.

.text

	main:
		addi $s0,$zero,4
		addi $s1,$zero,10
		addi $s2,$zero,12
		
		addi $t0,$zero,0 
		
		sw $s0,Array($t0) # s0 registerini yani 4 u array e kaydet
			addi $t0,$t0,4 # 4 Byte indeksi artir
		sw $s1,Array($t0)  # simdi tekrar kaydetme islemi 10 icin.
			addi $t0,$t0,4 # 4 byte sonrasina gec
		sw $s2,Array($t0)  # ve buraya da 12 sayisini kaydet
		
		lw $t2,Array($zero) # dizinin ilk elemanini getir
		
		li $v0,1
		move $a0,$t2
		syscall
		
		li $v0,10
		syscall