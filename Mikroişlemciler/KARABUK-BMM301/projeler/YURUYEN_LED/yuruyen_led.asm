LIST P=16F877A ; hangi mikrodenetleyici kullan�yorsak onu belirtiyoruz.
INCLUDE <P16F877A.INC> ; <> aras�nda yer alan dosya i�erisinde ki tan�mlamalar� kullanmak i�in ekliyoruz.

__CONFIG _CP_OFF &_WDT_OFF &_HS_OSC &_PWRTE_OFF &_LVP_OFF

SAYAC0 EQU 0X20 ; haf�za adresi 20H den ba�l�yor pic de. (bank0 i�in)
SAYAC1 EQU 0X21 ; 3 adet register tan�mlad�k.
SAYAC2 EQU 0X22

	ORG 0		; program belle�i �zerinde bir adrese git demek. (0.adrese git)
	GOTO START

	ORG 4		; interrupt kullanacak olursak laz�m olacak. (4.adrese git)
	GOTO START  ; goto ile pc �n g�sterdi�i adres de�i�ir. 

BANK0 MACRO ; macro, endm olan k�s�ma kadar ki b�t�n kodlar� copy paste yap i�lemini yap�yor.
	  BCF STATUS,5 ;Bank0 aktif olmas� i�in BCF ile 5.bit status yerine 0 de�erini veriyoruz.
	  ENDM
BANK1 MACRO
	  BSF STATUS,5 ;Bank1 aktif olmas� i�in BSF ile 5.bit status yere 1 de�eri veriliyor.
	  ENDM

START 
	  BANK1
	  BCF TRISC,0 ; TRISC'nin 1.bitini(RC1) 0 yap(output). TRISC, portc yi kullan�rken I/O kontrol� yapmam�z� sa�l�yor
	  BANK0
 	  BCF PORTC,0 ; RC1'i 0 yap yani.
		
	  BANK1
	  BCF TRISC,1 ; TRISC'nin 1.bitini(RC1) 0 yap(output). TRISC, portc yi kullan�rken I/O kontrol� yapmam�z� sa�l�yor
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
	  CALL BEKLE ; alt program �a�r�l�yor.
	  BCF PORTC,0
	  CALL BEKLE

	  BSF PORTC,1
	  CALL BEKLE ; alt program �a�r�l�yor.
	  BCF PORTC,1
	  CALL BEKLE

	  BSF PORTC,2
	  CALL BEKLE ; alt program �a�r�l�yor.
	  BCF PORTC,2
	  CALL BEKLE

	  BSF PORTC,3
	  CALL BEKLE ; alt program �a�r�l�yor.
	  BCF PORTC,3
	  CALL BEKLE

	  BSF PORTC,4
	  CALL BEKLE ; alt program �a�r�l�yor.
	  BCF PORTC,4
	  CALL BEKLE

	  BSF PORTC,5
	  CALL BEKLE ; alt program �a�r�l�yor.
	  BCF PORTC,5
	  CALL BEKLE

	  BSF PORTC,6
	  CALL BEKLE ; alt program �a�r�l�yor.
	  BCF PORTC,6
	  CALL BEKLE

	  BSF PORTC,7
	  CALL BEKLE ; alt program �a�r�l�yor.
	  BCF PORTC,7
	  CALL BEKLE

	  BSF PORTC,7
	  CALL BEKLE ; alt program �a�r�l�yor.
	  BCF PORTC,7
	  CALL BEKLE

	  BSF PORTC,6
	  CALL BEKLE ; alt program �a�r�l�yor.
	  BCF PORTC,6
	  CALL BEKLE

	  BSF PORTC,5
	  CALL BEKLE ; alt program �a�r�l�yor.
	  BCF PORTC,5
	  CALL BEKLE

	  BSF PORTC,4
	  CALL BEKLE ; alt program �a�r�l�yor.
	  BCF PORTC,4
	  CALL BEKLE

	  BSF PORTC,3
	  CALL BEKLE ; alt program �a�r�l�yor.
	  BCF PORTC,3
	  CALL BEKLE

	  BSF PORTC,2
	  CALL BEKLE ; alt program �a�r�l�yor.
	  BCF PORTC,2
	  CALL BEKLE

	  BSF PORTC,1
	  CALL BEKLE ; alt program �a�r�l�yor.
	  BCF PORTC,1
	  CALL BEKLE

	  BSF PORTC,0
	  CALL BEKLE ; alt program �a�r�l�yor.
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
