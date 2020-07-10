

.data # verilerimizi yazacağımız değişkenlerimizi yazacağımız alan
 
 #myMessage: .asciiz "Merhaba Dunya \n"
 myCharacter: .byte 'm'
 age: .word 23
.text # assembly kodlarını yazacağımız bölüm.

main:
	#Ekrana cümle yazdırma
	#li $v0,4
	#la $a0,myMessage
	#syscall
	
	#Ekrana karakter yazdırma
	#li $v0,4
	#la $a0,myCharacter
	#syscall
	
	#Ekrana integer yazdırma
	#li $v1,1
	#lw $a1,age
	#syscall
		