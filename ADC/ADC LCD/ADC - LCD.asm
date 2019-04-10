	LIST P = 16F877
	INCLUDE p16f877.inc

SAYAC0 EQU 0x20
SAYAC1 EQU 0x21
	ORG 0x00
	GOTO ANA_PROGRAM
	ORG 0x04
	GOTO KESME

ANA_PROGRAM
	BANKSEL PORTB
	CLRF PORTB
	BANKSEL TRISB		
	CLRF TRISB
	CLRF TRISC
	CLRF TRISD
	CLRF TRISE
	BSF PIE1,6 			;(ADIE)  A/D d�n��t�rme KESMElerine izin verdik
	MOVLW 0x80			;ADFM=1 ADRESH �n msb k�sm�ndaki 6 bit 0 kabul edilir.
	MOVWF ADCON1		;Veri ADRESH �n 2 bitlik lsb k�sm�na ve ADRESL ye yaz�l�r.
	BANKSEL PIR1		;bank 0
	BCF PIR1,6 		    ;(ADIF) ADC interrupt bayra��n� indir
	MOVLW h'C0'	        ;Aktif yap�lm�� t�m �evresel KESMElere izin verildi.	
	MOVWF INTCON	    ;Aktif yap�lm�� t�m KESMElere izin verildi.
	MOVLW 0xD1			;Kanal 2 se�tik.ADC �eviriciyi a��kt�k.
    MOVWF ADCON0	
	CALL GEC�K		    
	BSF ADCON0,2		;�eviriyi ba�lat
	
SONSUZ:GOTO SONSUZ			;sonsuz d�ng�...
	
KESME
	BTFSS PIR1,6		;(ADIF)Gelen interrupt ADC'den mi gelmi�
	RETFIE				
	BCF PIR1,6		    ;(ADIF)Flag� s�f�rla
	BTFSC ADCON0,3		;Kanal 3'� �evirdiysek 1, 2'yi �evirdiysek 0 olur
	GOTO Y�KLE_3	    ;de�eri port d ve port e ye y�kle
	GOTO Y�KLE_2	    ;de�eri port b ve port c ye y�kle
	
Y�KLE_2
	BANKSEL ADRESL
	MOVF ADRESL,w
	BANKSEL PORTB		;bank0
	MOVWF PORTB
	MOVF ADRESH,w
	MOVWF PORTC			;de�eri portB ve C'ye y�kle
	MOVLW 0xD9			;Kanal 3 se�.
   	MOVWF ADCON0
	CALL GEC�K		    ;1ms adc'yi bekle
	BSF ADCON0,2		;�eviriyi ba�lat		
   	RETFIE

Y�KLE_3
	BSF STATUS,RP0		;bank1
	MOVF ADRESL,w
	BCF STATUS,RP0		;bank0
	MOVWF PORTD
	MOVF ADRESH,w
	MOVWF PORTE			;de�eri portD ve E'ye y�kle
	MOVLW 0xD1			;Kanal 2 se�.
    MOVWF ADCON0
	CALL GEC�K		    ;1ms adc'yi bekle		
	BSF ADCON0,2		;�eviriyi ba�lat
    RETFIE

GEC�K	
	MOVLW d'8'			;working register'a at�lan deger kadar ms gecik
	MOVWF SAYAC1
D�NG�
	MOVLW d'255'
	MOVWF SAYAC0
D�NG�1
	DECFSZ SAYAC0,1
	GOTO D�NG�1
	DECFSZ SAYAC1,1
	GOTO D�NG�
	RETURN
END