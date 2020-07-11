.data

.text


	abc:

		addi $sp,$sp,-4
		sw $s0,0($sp)       # s0 registeri için stack de yer açıldı.
		add $s0,$zero,$zero # k = 0
		
	L1: add $t0,$s0,$a2     # t0 = par2 nin adresi geldi.
		lb  $t3,0($t0)      # t3 = par2[k] nın değeri geldi.
		add $t1,$s0,$a1     # t1 = par1[k] in adresi var.
		sb  $t3,0($t1)      # par2[k] değerini par1[k] adresine yaz.
		beq $t3,$zero,L2    # par2[k] == 0 ise L2 ye git
		addi $s0,$s0,1      # k = k + 1
		j L1                # L1'e dallan
		
	L2: add  $v0,$s0,$zero  # return k yaptım.
		lw   $s0,0($sp)     # Stack eski haline getir.
		addi $sp,$sp,4
		jr   $ra            # main de kaldığın yer+4 ten devam et.
		
		
		
