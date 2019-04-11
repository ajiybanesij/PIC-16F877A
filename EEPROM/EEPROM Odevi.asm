;*******************************************************************
;	Dosya Ad�		: 9_1.asm
;	Program�n Amac�		: Dahili eeprom belle�e veri yazma ve okuma
;	PIC DK2.1a 		: PORTB ��k�� ==> LED
;				: XT ==> 4Mhz
;*******************************************************************
	list p=16F877A
	include "p16F877A.inc"	
	__config H'3F39' 		;T�m program sigortalar� kapal�, 
	adres equ 0x20
sayac0 equ 0x21
sayac1 equ 0x22
sayac2 equ 0x23
DEGER equ 0x24
SAYA0 EQU 0X25
SAYA1 EQU 0X26
					;Osilat�r XT ve 4Mhz
	ORG 	0			;Reset vekt�r adresi.
	clrf 	PCLATH			;0. Program sayfas� se�ildi.
	goto 	ana_program		;ana_programa'a git.
	
	ORG	4			;Kesme vekt�r adresi.
    goto KESME				;Kesme kullan�m� gerekiyorsa 
					;buradan itibaren yaz�lmal�. 
					;ya da goto komutu ile buradan y�nlendirilmeli.
KESME
	BTFSS PIR1,6	 ;Gelen kesme A/D kesmesimi ??	
	RETFIE			 	
	BCF PIR1,6		 ;A/D kesme bayra��n� indir.   
	BTFSS ADCON0,2	 ;A/D kesmesi hangi kanaldan gelmi� ??	
	retfie        	
    BANKSEL ADRESL   	
	MOVF ADRESL,w   ;ADRESL = W
	BANKSEL DEGER		
	MOVWF DEGER    ;10 bitin en anlamas�z 8 bitini PORTB ye at.
	MOVLW 0xD1			
   	MOVWF ADCON0    ;Kanal3 e git.
	CALL GEC�K		    
	BSF ADCON0,2	;A/D d�n��t�r�c� i�lem yaps�n.			
   	RETFIE

;-------------------------------------------------------------------
; Dahili EEPROM'a veri yazma alt program�:
; �a�r�lmadan �nce EEADR kaydedicisine yaz�lacak adres, EEDATA 
; kaydedicisine ise yaz�lacak veri y�klenmeli.
;-------------------------------------------------------------------
dahili_EEPROM_yaz
	banksel EECON1			;EECON1'in bulundu�u BANK se�ildi.
	bcf	INTCON, GIE		;Genel kesmeler pasif. (Yazmada 
					;i�lem ak��� bozulmamal�.)
	bsf	EECON1, WREN		;Yazma etkinle�tirme bit�i set 
					;edildi.
	movlw	0x55			;Yazma i�in buradan itibaren 5 
					;sat�r aynen korunmal�.
	movwf	EECON2
	movlw	0xAA
	movwf	EECON2
	bsf	EECON1, WR		;Yaz komutu verildi.
	bsf	INTCON, GIE		;Genel kesmeler aktif. (Kesme 
					;kullan�lmayacaksa silinebilir.)
    call Gecik		;100ms adc'yi bekle	
;dahili_ee_j1
;	btfsc 	EECON1, WR		;Yazma i�lemi tamamlanana kadar 
;					;bekle (WR=0 olana kadar).
;	goto 	dahili_ee_j1
;	bcf 	EECON1, WREN		;Yazma izni kald�r�ld�.
;	return
;-------------------------------------------------------------------
; Dahili EEPROM'dan veri okuma alt program�: �a�r�lmadan �nce EEADR 
; kaydedicisine okunacak verinin adresi y�klenmeli.
;-------------------------------------------------------------------
dahili_EEPROM_oku
	banksel EECON1
	bsf	EECON1, RD
	banksel EEDATA
	movf	EEDATA, W
	return
;-------------------------------------------------------------------
; Ana program: 0x0A dahili EEPROM adresine 0x97 bilgisi y�kleniyor,
; Daha sonra ayn� adresten veri okunarak PORTB'deki LED'lerde 
; g�r�nt�leniyor.
;-------------------------------------------------------------------
ana_program
	BANKSEL PIE1		
	BSF PIE1,6 	     ;A/D d�nu�t�r�c�n�n kesmelerine izin ver.	
	MOVLW 0x80	     ;10 bitin en anlaml� 2 bitini ADRESH a,
	MOVWF ADCON1	 ;Di�er 8 bitide ADRESL a at�l�yor.
	BANKSEL PIR1	 	
	BCF PIR1,6 		 ;ADIF D�nu�turme i�lem� gerceklesmedi.   
	MOVLW h'C0'	     ;Aktif yap�lm�� t�m kesmelere izin ver.  	
	MOVWF INTCON	 ;Aktif yap�lm�� t�m cevresel kesmelere izin ver.   
	MOVLW 0xD1		 	
    MOVWF ADCON0	 ;Kanal 2 yi se�tik.
	CALL GEC�K		    
	BSF ADCON0,2	 ;A/D d�n��t�r�c� i�lem yaps�n.	
	

	banksel TRISC			;BANK1 se�ildi, TRISB bu bankta.
	clrf	TRISC			;PORTB pinleri ��k��a ayarland�.
	banksel PORTC			;BANK0 se�ildi, PORTB bu bankta.
	clrf	PORTC			;�lk anda LED'ler s�n�k.
	movlw	0x00			;Yaz�lacak Dahili EEPROM adresi
	movwf adres
	banksel PORTC
	bsf  	PORTC,0
	bcf		PORTC,1
bir
	
	movf adres,w
	banksel EEADR			;EEADR kaydedicisi i�in BANK se�ildi.
	movwf 	EEADR			;Adres bilgisi y�klendi.
	movfw	DEGER		;Yaz�lacak veri.
	movwf	EEDATA			;Veri y�klendi.
	call	dahili_EEPROM_yaz	;Yazma alt program�n� �a��r.
	banksel EEADR			;EEADR kaydedicisi i�in BANK se�ildi.
	movlw	0x0A			;Okunacak Dahili EEPROM adresi.
	movwf	EEADR			;Adres bilgisi y�klendi.
	call	dahili_EEPROM_oku	;Okuma alt program�n� �a��r.
	;banksel PORTC		;BANK0'a ge�.
	;movwf	PORTC		;Okunan de�eri LED'lerde g�r�nt�le.
    incfsz  adres,f
goto bir
banksel PORTC
	bcf  	PORTC,0
	bsf		PORTC,1
	goto	ana_j1
;---------------------------------------

Gecik						;( 240 * 255 ) / 2 = W * 1020�sec ~= W ms @ 8Mmhz
Dongu0
	movlw d'240'
	movwf sayac1
Dongu1
	clrf sayac2
Dongu2
	incfsz sayac2,f
	goto Dongu2
	decfsz sayac1,f
	goto Dongu1
	return

;----------------------------------------
GEC�K	
	MOVLW d'8'		;(8*250)/2=1000 microsec
	MOVWF SAYA1
D�NG
	MOVLW d'250'
	MOVWF SAYA0
D�NG1
	DECFSZ SAYA0,1
	GOTO D�NG1
	DECFSZ SAYA1,1
	GOTO D�NG
	RETURN


ana_j1
	goto	ana_j1			;Sistem kapat�lana yada resetlenene 	


	
END	
