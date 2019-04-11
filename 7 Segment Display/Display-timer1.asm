    	LIST    p=16F877
		#include "P16F877.INC"
	

		SAYAC EQU 20H 		; Kesmeleri sayacak saya�
		SAYAC_SAYI EQU 21H  ;Say�n�n de�erini belirleyecek saya�

;------------------------------------------------------------		
;		PROGRAMA BA�LAYALIM									;										
;------------------------------------------------------------
	ORG 0
 		GOTO ANA_PROGRAM
		ORG 4
		GOTO KESME

;------------------------------------------------------------
;		�LK��LEM ALTPROGRAMINI BA�LANGICI					;
;------------------------------------------------------------
	ILKISLEM:
		MOVLW H'04' 	  ;Kesmeleri sayacak olan sayac
		MOVWF SAYAC
		MOVLW B'00110001' ; Timer1 i�in prescale, osilat�r se�imi ve
		MOVWF T1CON		  ; Timer1'in �al��ma durumunun belirtilmesi
		BCF PIR1,0		  ; Timer1 fla��n� indiriyoruz 
		BSF STATUS,RP0 
 		BSF PIE1,0		  ; Timer1'in �al��mas�na izin verilmesi
		MOVLW h'00'
		MOVWF TRISA 	  ; PORTA'y� ��k�� yapt�k
		MOVWF TRISD 	  ; PORTD'yi ��k�� yapt�k
		BCF STATUS,5 	
		MOVLW H'01'		  ; Deney setimizde sadece sondaki display�n
		MOVWF PORTA 	  ; i�in vermemmiz gereken say�
		BSF INTCON,7	  ; Genel kesmelere izin verdik
		BSF INTCON,6	  ;	�evresel kesmelere izin verdik
		MOVLW H'00'		   
		MOVWF TMR1L		  ;Timer1'in nerden ba�layaca��n� se�tik
		MOVWF TMR1H			
		CALL ORTAK_KATOT
		INCF SAYAC_SAYI,1
		MOVWF PORTD
		RETURN 

;------------------------------------------------------------
;		KESME ALT PROGRAMIMIZIN BA�LANGICI					;
;------------------------------------------------------------
	KESME:
		BCF PIR1,0
		DECFSZ SAYAC,1
		RETFIE
		MOVFW SAYAC_SAYI	;Tablodan hangi say�y� alaca��m�z� se�iyoruz
		CALL ORTAK_KATOT
		INCF SAYAC_SAYI,1	;Bi dahaki sefer i�in gerekli say�y�n�n adresi
		MOVWF PORTD
		MOVLW H'04'
		MOVWF SAYAC
		RETFIE

	
;------------------------------------------------------------
;		ORTAK KATOT PROGRAMIMIZIN BA�LANGICI				;
;------------------------------------------------------------
	ORTAK_KATOT:
		addwf	PCL, F
		retlw	0x3F		; 0 rakam� i�in segment de�eri.
		retlw	0x06		; 1 rakam� i�in segment de�eri.
		retlw	0x5B		; 2 rakam� i�in segment de�eri.
		retlw	0x4F		; 3 rakam� i�in segment de�eri.
		retlw	0x66		; 4 rakam� i�in segment de�eri.
		retlw	0x6D		; 5 rakam� i�in segment de�eri.
		retlw	0x7D		; 6 rakam� i�in segment de�eri.
		retlw	0x07		; 7 rakam� i�in segment de�eri.
		retlw	0x7F		; 8 rakam� i�in segment de�eri.
		MOVLW H'FF'			; FF ten sonra 00 gelir sayac 
		MOVWF SAYAC_SAYI	; S�f�rlanm�� olur
		retlw	0x6F		; 9 rakam� i�in segment de�eri.


;------------------------------------------------------------
;				ANA PROGRAM									;
;------------------------------------------------------------
	ANA_PROGRAM:
		CALL ILKISLEM
	SONSUZ:
		GOTO SONSUZ


	END
	