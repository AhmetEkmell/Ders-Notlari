.data

sayi1: .word 33
sayi2: .word 10

.text

 main: 
 
	#hafizadan verileri registerlere getirme.
	lw $s0,sayi1 # burada da parantez icinde zero reg ini kullanmadik.
	lw $s1,sayi2
	
	#cikarma islemi
	sub $t0,$s0,$s1
	
	#ekrana yazdirma
	li $v0,1
	move $a0,$t0 #toplama isleminde ekrana yazdirirken add kullanmistik bu daha kisa sanirim.
	syscall