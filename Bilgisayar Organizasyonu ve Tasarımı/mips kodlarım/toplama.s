.data

sayi1: .word 23
sayi2: .word 44

.text

main: 

	#sayi1 ve sayi2 hafızadaki degerleri gecici registerlere aktariliyor.
	lw $t0,sayi1($zero)
	lw $t1,sayi2($zero)
	
	# t2 = t1 + t0
	add $t2,$t1,$t0
	
	#ekrana yazdirma
	li $v0,1
	add $a0,$zero,$t2
	syscall