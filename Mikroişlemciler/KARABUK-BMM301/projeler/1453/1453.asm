LIST p=16F877A
INCLUDE <P16F877A.INC>

__CONFIG _CP_OFF &_WDT_OFF &_HS_OSC &_PWRTE_OFF &_LVP_OFF

SAYAC0 EQU 0X20 ; REGISTERLARIMIZI BURADA ADRES ATAMASI YAPIYORUZ.
SAYAC1 EQU 0X21
SAYAC2 EQU 0X22
BIRLER EQU 0X23
ONLAR  EQU 0X24
YUZLER EQU 0X25
BINLER EQU 0X26

	ORG 0 ; PROGRAM 0. ADRESTEN BAÞLAYACAK
	GOTO START

	ORG 4 ; INTERRUPT ÝÇÝN LAZIM OLURSA KULLANACAÐIZ
	GOTO START

BANK0 MACRO
	  BCF STATUS,5 ;RP0 = 0
	  ENDM
BANK1 MACRO
	  BSF STATUS,5 ;RP0 = 1
	  ENDM

START BANK1
	  CLRF TRISD ; D PORTU OUTPUT OLDU
	  CLRF TRISB ; B PORTU OUTPUT OLDU
	  BANK0
	  CLRF PORTB ; B PORTU 0 OLDU
	  CLRF PORTD ; D PORTU 0 OLDU
	  MOVLW .1     
	  MOVWF BINLER
	  MOVLW .4
	  MOVWF YUZLER   ; Binler, yuzler, onlar ve birler registerlerine 1,4,5 ve 3 deðerlerini yukledik.
	  MOVLW .5
	  MOVWF ONLAR
	  MOVLW .3
	  MOVWF BIRLER

LOOP  CALL GOSTER    ; alt metoda dallan.
	  GOTO LOOP      ; goster return olunca tekrar loop dan devam.

GOSTER MOVF  BINLER,W    ; binler reg'i, working register a getir.
	   MOVWF PORTD       ; portD binler degeri var.
	   MOVLW B'00000001' ; working register a 00000001 yüklendi. Cunku b portlarý display seçme ve bu portun b0 ini aktif etmek istiyorum.
	   MOVWF PORTB		 ; portB0 aktif oldu ve binler register degeri output oldu.
 	   CALL  BEKLE	     ; alt metoda giderek gecikme yaptýrýyoruz.
	   
	   MOVF  YUZLER,W    ; yuzler reg'i, working register a getir.
	   MOVWF PORTD       ; portD yuzler degeri var. 
	   MOVLW B'00000010' ; portB data hattýmýz ve yuzler display için portB1 = 1 olmasýný istiyorum.
	   MOVWF PORTB	     ; portB1 = 1 aktif oldu ve display de 4 degerimiz var.
 	   CALL  BEKLE       ; alt metotda gecikme yapiyoruz.
	   
	   MOVF  ONLAR,W
	   MOVWF PORTD
	   MOVLW B'0000100'  ; portB2 nin aktif olmasý için working register a belirtilen degeri veriyoruz.
	   MOVWF PORTB       ; portB2 = 1 aktif oldu.
 	   CALL BEKLE

       MOVF  BIRLER,W
	   MOVWF PORTD
	   MOVLW B'00001000' ;portB3 aktif olmasýný istiyorum.
	   MOVWF PORTB       ;portB3 = 1 aktif oldu.
 	   CALL  BEKLE
	   CLRF  PORTB ; portB yani data hattýmýzda ki displayler kapalý yapýldý. Tekrar çagrilincaya kadar 0 olacak.

   RETURN ; alt metot olduðu için return olmasý gerekiyor.


BEKLE  MOVLW .100
	   MOVWF SAYAC0
BEKLE0 MOVWF .100
	   MOVWF SAYAC1
BEKLE1 MOVLW .100
	   MOVWF SAYAC2
BEKLE2
	   DECFSZ SAYAC2,F
	   GOTO BEKLE2
	   DECFSZ SAYAC1,F
	   GOTO BEKLE1
	   DECFSZ SAYAC0,F
	   GOTO BEKLE0
	RETURN
 	END
