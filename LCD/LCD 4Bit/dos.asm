list 				p=16F877
include 		"p16F877.inc" 

	CBLOCK	0x20			;16F877'n�n RAM ba�lang�� adresi, 
	sayac0
	sayac1
	sayac2
	LCD_data						;LCD i�in ge�ici veri de�i�keni.
	LCD_tmp0					;LCD i�in ge�ici veri de�i�keni.
	LCD_tmp1					;LCD i�in ge�ici veri de�i�keni.
	LCD_line						;LCD i�in sat�r bilgisini tutan de�i�ken.
	LCD_pos						;LCD i�in s�tun bilgisi tutan de�i�ken.
	ENDC

	ORG 		0 
	goto 		anaprogram
	ORG 		4
	goto		kesme

; LCD'nin ba�l� oldu�u port tan�mlar� yap�l�yor.
#define 		LCD_DataPort 		PORTB				;Data pinlerinin ba�l� oldu�u port (D7-D4  -> RB3-RB0 ).
#define 		LCD_CtrlPort 			PORTB			;Kontrol pinlerinin ba�land��� port
; LCD'nin kontrol pinlerinin ba�l� oldu�u mikrodenetleyici pinleri tan�mlan�yor.
#define 		LCD_RS			4							;LCD RS pini RB4'e ba�l�.
#define 		LCD_EN			5							;LCD E pini RB5'e ba�l�.
#define 		LCD_RW			6							;LCD RW pini RB6'ya ba�l�.

mesajlar															;LCD'ye g�nderilecek mesajlar buraya yaz�l�yor.
			addwf				PCL, F							;mesaj adresini y�kle.
			msg0	dt			"Huzeyfe", 0					;0 sonland�rma karakteri.
			msg1	dt			"Kocabas", 0
			msg2	dt			"Mikroislemciler", 0

; LCD ile ilgili macro tan�mlar�:
LCD_RS_HIGH				macro							;LCD'nin RS giri�ini HIGH yaparak 
			banksel 			LCD_CtrlPort					;veri alma modu se�ilir.
			bsf					LCD_CtrlPort, LCD_RS
			endm

LCD_RS_LOW				macro							;LCD'nin RS giri�ini LOW yaparak 
			banksel 			LCD_CtrlPort					;komut alma modu se�ilir.
			bcf					LCD_CtrlPort, LCD_RS	
			endm

LCD_EStrobe 				macro								;LCD'ye veri ya da komut 
			banksel 			LCD_CtrlPort						;g�nderildi�inde LCD'nin 
			bsf					LCD_CtrlPort, LCD_EN		;bunu i�lemesini sa�lar.
			movlw				d'1'
			call					gecikme_mikrosn
			bcf					LCD_CtrlPort, LCD_EN
			endm

LCD_Locate					macro	line, pos
			movlw 				line									;Sat�r bilgisini y�kle.
			movwf				LCD_line	
			movlw 				pos									;S�tun bilgisini y�kle.
			movwf				LCD_pos				
			call					LCD_SetPos						;Kurs�r� konumland�r.
			endm

; 4 bit ileti�im modunda LCD'ye veri transferi yapar.
LCD_NybbleOut
			andlw				0x0F									;En de�ersiz 4 bit W'de,
			movwf				LCD_tmp0							;ge�ici de�i�kene al�n�yor.
			movf					LCD_DataPort,W				;LCD'nin data pinlerinin ba�l� oldu�u port bilgisi W'de.
			andlw				0xF0									;Port bilgisinin en de�erli 4 bit�i korunuyor.
			iorwf					LCD_tmp0, W					;Korunan bilgi ile veri birle�tiriliyor.
			movwf				LCD_DataPort					;PortA transfer ediliyor.
			LCD_EStrobe											;LCD'nin veriyi almas� sa�lan�yor.
			movlw				d'1'
			call					gecikme_mikrosn
			return

; LCD'ye 1 byte komut transfer eder.
LCD_SendCmd         	         	
			movwf				LCD_data	 						;Komutu ge�ici de�i�kene al.
			swapf				LCD_data, W   					;En de�erli 4 bit�i g�nder.
			LCD_RS_LOW											;RS = 0 (komut modu)
			call					LCD_NybbleOut
			movf					LCD_data, W					;En de�ersiz 4 bit�i g�nder.
			LCD_RS_LOW											;RS = 0 (komut modu)
			call					LCD_NybbleOut			
			return

; LCD'ye bir rakam ya da bir karakter g�ndermek i�in kullan�l�r.
LCD_SendCHAR													;LCD'ye karakter g�ndermek i�in �a�r�lacak.
			movwf				LCD_data							;Komutu ge�ici de�i�kene al.
			swapf				LCD_data, W					;En de�erli 4 bit�i g�nder.
			LCD_RS_HIGH											;RS = 1 ( veri g�nderme modu )
			call					LCD_NybbleOut
			movf					LCD_data, W					;En de�ersiz 4 bit�i g�nder.
			LCD_RS_HIGH											;RS = 1 ( veri g�nderme modu )
			call					LCD_NybbleOut
			return

; LCD ekran belle�ini siler.
LCD_Clear
			movlw				0x01									;LCD g�r�nt� belle�ini sil, dolay�s� ile 
			call					LCD_SendCmd					;LCD'de g�r�nen bilgileri de sil.
			movlw				d'1'
			call					gecikme_mikrosn
			return

; Kurs�r� g�ster
LCD_CursorOn
			movlw				0x0F									;Display'i a�, kurs�r� g�ster. 
			call					LCD_SendCmd					;Blink ON.
			return

; Kurs�r� gizle
LCD_CursorOff
			movlw				0x0C								;Display'i a�, kurs�r� gizle,
			call					LCD_SendCmd					;Blink OFF.
			return

; LCD ekran� kullan�ma haz�rlar.
LCD_init
			bsf					STATUS, RP0					;BANK1 se�ildi. Y�nlendirme kaydedicileri bu bankta.
			movf					LCD_DataPort, W
			andlw				0xF0									;Portun en de�ersiz d�rtl�s� ��k�� yap�ld�.
			movwf				LCD_DataPort					;Port y�nlendirildi.
			bcf					LCD_CtrlPort, LCD_EN		;LCD_CtrlPort'un LCD_EN pini ��k��a y�nlendirildi.
			bcf					LCD_CtrlPort, LCD_RS		;LCD_RS pini ��k�� yap�ld�. 
			bcf					LCD_CtrlPort, LCD_RW		;LCD_RW pini ��k�� yap�ld�.
			bcf					STATUS, RP0					;BANK0 se�ildi.
			clrf					LCD_DataPort
			movlw				d'1'
			call					gecikme_mikrosn
			LCD_RS_LOW
			movlw				0x03									;8 bit ileti�im komutu verildi.
			call					LCD_NybbleOut	
			movlw				d'20'
			call					gecikme_mikrosn
			LCD_EStrobe											;8 bit ileti�im i�in komut yinelendi.
			movlw				d'10'
			call					gecikme_mikrosn
			LCD_EStrobe											;8 bit ileti�im i�in komut yinelendi.
			movlw				d'10'
			call					gecikme_mikrosn
			LCD_RS_LOW
			movlw				0x02									;LCD, 4 Bit ileti�im moduna al�nd�.
			call					LCD_NybbleOut	
			movlw				d'10'
			call					gecikme_mikrosn
			movlw				0x28									;4 bit ileti�im, 2 sat�r LCD, 5x7 
			call					LCD_SendCmd					;font se�ildi.
			movlw				0x10									;LCD'de yaz�n�n kaymas� engellendi.
			call					LCD_SendCmd
			movlw				0x01									;LCD g�r�nt� belle�ini sil.
			call					LCD_SendCmd
			movlw				d'1'
			call					gecikme_milisn
			movlw				0x06									;Kurs�r her karakter yaz�m�nda bir 
			call					LCD_SendCmd					;ilerlesin.
			movlw				0x0C								;Display'i a�, kurs�r� gizle.
			call					LCD_SendCmd
			return

; Mesaj etiketi (adresi) W�ye y�klenen mesaj� LCD ekranda g�r�nt�ler                       
LCD_SendMessage
			Movwf				FSR									;�lk karaktere i�aret et (onun adresini  tut).
LCD_SMsg			
			Movf					FSR, W							;��aret edilen karakter s�ras�n� W'ye al.
			incf					FSR, F								;Bir sonraki karaktere konumlan.
			Call					mesajlar							;Mesajlardan ilgili karakteri al.
			iorlw  				0										;Mesaj sonu mu? 0 bilgisi al�nd� ise mesaj sonu demektir.
			btfsc 				STATUS, Z						;Mesaj sonu de�il ise bir komut atla.
			return														;Mesaj sonu ise alt programdan ��k.
			call   				LCD_SendCHAR				;Karakteri LCD'ye yazd�r.
			goto   				LCD_SMsg						;Bir sonraki karakter i�in i�lemleri tekrarla.
;-------------------------------------------------------------------
; Kurs�r� LCD'de istenilen sat�r ve s�tuna konumland�r�r. Text'in 
; nereye yaz�laca��n� belirler. 1 - 2 sat�r olan LCD'ler i�in 
; yaz�ld���na dikkat ediniz. 4 sat�r LCD'ler i�in LCD_line de�erinin
; 0, 1, 2 veya 3 olmas� durumuna g�re DDRAM ba�lang�� adresleri 
; tespit edilmelidir.
;-------------------------------------------------------------------
LCD_SetPos
			movlw				0x80									;0. sat�r i�in DDRAM adres ba�lang�� de�eri.
			movf					LCD_line, F	
			btfss					STATUS, Z						;0. sat�r ise bir komut atla.
			movlw				0xC0								;1. sat�r i�in 0x80 adresine ilave edilecek de�er.
			addwf				LCD_pos, W						;Kurs�r pozisyonu da ilave edilerek DDRAM'deki adres bulunuyor.
			call					LCD_SendCmd
			return

;Gelen parametre x 0.1 sn kadar bekleme yapar.
gecikme_sn
			movwf				sayac0
dongu0
			movlw				d'255'
			movwf				sayac1
dongu1
			movlw				d'255'
			movwf				sayac2
dongu2
			decfsz				sayac2,F
			goto					dongu2
			decfsz				sayac1
			goto					dongu1
			decfsz				sayac0
			goto					dongu0
			return
;Gelen parametre x 1.5 mikrosn kadar bekleme yapar.
gecikme_mikrosn
			movwf				sayac0
dongu
			decfsz				sayac0,F
			goto					dongu
			return
;Gelen parametre x 382 mikrosn kadar bekleme yapar.
gecikme_milisn
			movwf				sayac0
dongu3
			movlw				d'255'
			movwf				sayac1
dongu4
			decfsz				sayac1,F
			goto					dongu1
			decfsz				sayac0
			goto					dongu0
			return

kesme
			retfie
anaprogram
			call					LCD_init							;LCD�yi kullan�ma haz�rlar.
Ana_j0
			call					LCD_CursorOff					;Kurs�r� gizle.
			LCD_Locate		0, 0									;0. sat�r, 0. s�tuna konumlan.
			movlw				msg0-6								;mesaj0 yaz (adresi 6 eksi�i).
			call					LCD_SendMessage
			LCD_Locate		0, 9									;1. sat�r, 0. s�tuna konumlan
			movlw				msg1-6								;mesaj1 yaz.
			call					LCD_SendMessage
			LCD_Locate		1, 1									;1. sat�r, 0. s�tuna konumlan
			movlw				msg2-6								;mesaj1 yaz.
			call					LCD_SendMessage
			movlw				d'255'
			call					gecikme_sn
END 