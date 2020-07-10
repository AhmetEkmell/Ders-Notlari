.data


.text

main:
	
		addi $t0,$zero,2000 # t0 = 2000
		addi $t1,$zero,10   # t1 = 10
		
	   #mul  $t2,$t1,$t0 bu da normal carpma islemi
		
		mult $t0,$t1        # Hi ve Lo adlı registerlar var. Kodumuz carpma islemini yapıyor ve Lo registerine 20000 sayısını kaydediyor.
		
		mflo $s0			# Burada da Lo registerinde yer alan veri s0 registerine kaydediliyor.
		
		li $v0,1
		add $a0,$zero,$s0   # bu kisim ekrana yazdirma kismi
		syscall