LIST P=16F877A ; hangi mikrodenetleyici kullanýyorsak onu belirtiyoruz.
INCLUDE <P16F877A.INC> ; <> arasýnda yer alan dosya içerisinde ki tanýmlamalarý kullanmak için ekliyoruz.

__CONFIG _CP_OFF &_WDT_OFF &_HS_OSC &_PWRTE_OFF &_LVP_OFF

SAYAC0 EQU 0X20 ; hafýza adresi 20H den baþlýyor pic de. (bank0 için)
SAYAC1 EQU 0X21 ; 3 adet register tanýmladýk.
SAYAC2 EQU 0X22

	ORG 0		; program belleði üzerinde bir adrese git demek. (0.adrese git)
	GOTO START

	ORG 4		; interrupt kullanacak olursak lazým olacak. (4.adrese git)
	GOTO START  ; goto ile pc ýn gösterdiði adres deðiþir. 

BANK0 MACRO ; macro, endm olan kýsýma kadar ki bütün kodlarý copy paste yap iþlemini yapýyor.
	  BCF STATUS,5 ;Bank0 aktif olmasý için BCF ile 5.bit status yerine 0 deðerini veriyoruz.
	  ENDM
BANK1 MACRO
	  BSF STATUS,5 ;Bank1 aktif olmasý için BSF ile 5.bit status yere 1 deðeri veriliyor.
	  ENDM

START 
	  BANK1
	  BCF TRISC,0 ; TRISC'nin 1.bitini(RC1) 0 yap(output). TRISC, portc yi kullanýrken I/O kontrolü yapmamýzý saðlýyor
	  BANK0
 	  BCF PORTC,0 ; RC1'i 0 yap yani.
		
	  BANK1
	  BCF TRISC,1 ; TRISC'nin 1.bitini(RC1) 0 yap(output). TRISC, portc yi kullanýrken I/O kontrolü yapmamýzý saðlýyor
	  BANK0
 	  BCF PORTC,1

	  BANK1
	  BCF TRISC,2
	  BANK0
	  BCF PORTC,2
	  
      BANK1
	  BCF TRISC,3
	  BANK0
	  BCF PORTC,3

      BANK1
	  BCF TRISC,4
	  BANK0
	  BCF PORTC,4

      BANK1
	  BCF TRISC,5
	  BANK0
	  BCF PORTC,5

      BANK1
	  BCF TRISC,6
	  BANK0
	  BCF PORTC,6

      BANK1
	  BCF TRISC,7
	  BANK0
	  BCF PORTC,7
		
	  


LOOP
	  BSF PORTC,0
	  CALL BEKLE ; alt program çaðrýlýyor.
	  BCF PORTC,0
	  CALL BEKLE

	  BSF PORTC,1
	  CALL BEKLE ; alt program çaðrýlýyor.
	  BCF PORTC,1
	  CALL BEKLE

	  BSF PORTC,2
	  CALL BEKLE ; alt program çaðrýlýyor.
	  BCF PORTC,2
	  CALL BEKLE

	  BSF PORTC,3
	  CALL BEKLE ; alt program çaðrýlýyor.
	  BCF PORTC,3
	  CALL BEKLE

	  BSF PORTC,4
	  CALL BEKLE ; alt program çaðrýlýyor.
	  BCF PORTC,4
	  CALL BEKLE

	  BSF PORTC,5
	  CALL BEKLE ; alt program çaðrýlýyor.
	  BCF PORTC,5
	  CALL BEKLE

	  BSF PORTC,6
	  CALL BEKLE ; alt program çaðrýlýyor.
	  BCF PORTC,6
	  CALL BEKLE

	  BSF PORTC,7
	  CALL BEKLE ; alt program çaðrýlýyor.
	  BCF PORTC,7
	  CALL BEKLE

	  BSF PORTC,7
	  CALL BEKLE ; alt program çaðrýlýyor.
	  BCF PORTC,7
	  CALL BEKLE

	  BSF PORTC,6
	  CALL BEKLE ; alt program çaðrýlýyor.
	  BCF PORTC,6
	  CALL BEKLE

	  BSF PORTC,5
	  CALL BEKLE ; alt program çaðrýlýyor.
	  BCF PORTC,5
	  CALL BEKLE

	  BSF PORTC,4
	  CALL BEKLE ; alt program çaðrýlýyor.
	  BCF PORTC,4
	  CALL BEKLE

	  BSF PORTC,3
	  CALL BEKLE ; alt program çaðrýlýyor.
	  BCF PORTC,3
	  CALL BEKLE

	  BSF PORTC,2
	  CALL BEKLE ; alt program çaðrýlýyor.
	  BCF PORTC,2
	  CALL BEKLE

	  BSF PORTC,1
	  CALL BEKLE ; alt program çaðrýlýyor.
	  BCF PORTC,1
	  CALL BEKLE

	  BSF PORTC,0
	  CALL BEKLE ; alt program çaðrýlýyor.
	  BCF PORTC,0
	  CALL BEKLE

      GOTO LOOP

BEKLE
	  MOVLW .100
	  MOVWF SAYAC0
BEKLE1
	  MOVLW .100
	  MOVWF SAYAC1
BEKLE2
	  MOVLW .50
	  MOVWF SAYAC2
BEKLE3
	  DECFSZ SAYAC2,F
	  GOTO BEKLE3
	  DECFSZ SAYAC1,F
	  GOTO BEKLE2
	  DECFSZ SAYAC0,F
	  GOTO BEKLE1
RETURN
END
