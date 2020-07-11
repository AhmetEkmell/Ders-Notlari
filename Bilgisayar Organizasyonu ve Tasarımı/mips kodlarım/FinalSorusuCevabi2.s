.data 

.text

main:
		li $t0,0 # i = 0
		li $t1,0 # j = 0
		li $t2,10 # 10 değeri tutuluyor
		li $t4,0x12345678 # dizinin başlangıç adresi
		dongu1:
			blt $t0,$t2,dongu2 # i < 10 ise dongu2 ye git
			j exit # şartsız exit e git
			
		dongu2:
			sub $t3,9,$t0 # t3 = 9-i
			blt $t1,$t3,dallan # j < 9 - i ise dallan a git
			addi $t0,$t0,1 # i = i + 1
			j dongu1  # dongu1 e git
			
		dallan:
			sll $t5,$t1,2 # t5 = j * 4 işlemi
			add $t5,$t4,$t5 # t5 = arr[j] adresi geldi
			lw $t6,0($t5) # t6 = arr[j] değeri geldi
			lw $t7,4($t5) # t7 = arr[j+1]
			blt $t7,$t6,topla # a[j+1] < a[j] ise toplaya git
			addi $t1,$t1,1 # değilse j = j + 1 yap
			j dallan # şartsız dallan a git
			
		topla:
			
			add $s0,$t6,$t7 # s0(yeni arr[j] değeri) = arr[j] + arr[j+1]
			sub $s1,$s0,$t7 # s1(yeni arr[j+1] değeri) = arr[j] - arr[j+1]
			sub $s0,$s0,$s1 # s0 (son arr[j] değeri) = arr[j] - arr[j+1]
			addi $t1,$t1,1  # j = j + 1
			j dongu2
			
		exit:
		
			li $v0,10
			syscall