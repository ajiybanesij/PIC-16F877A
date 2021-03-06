#INCLUDE<P16F877.INC>
	USART_DATA		EQU		0X21
	LCD_VER�		EQU		0X24
	SAYAC1			EQU		0X22
	SAYAC2			EQU		0X23
	ORG	0X00
	
BASLA
	BANKSEL	TRISC
	CLRF 	TRISB
	BSF		TRISC,7
	BCF		TRISC,6
	CALL	RS232_INIT
	CALL	LCD_INIT
	MOVLW	0X02
	CALL	LCD_1
LOOP
	CALL	RS232_VER�AL
	CALL	RS232_VER�GONDER
	CALL	LCD_VER�_YAZ
	GOTO	LOOP
LCD_INIT
	MOVLW		H'02'				
	CALL 		LCD_KOMUT_YAZ			
	MOVLW		H'06'				
	CALL 		LCD_KOMUT_YAZ			
	MOVLW		0X28				
	CALL		LCD_KOMUT_YAZ			
	MOVLW		H'0C'					
	CALL		LCD_KOMUT_YAZ
	RETURN

LCD_KOMUT_YAZ
	MOVWF	LCD_VER�
	SWAPF	LCD_VER�,W
	CALL	LCD_KOMUT_GONDER
	MOVF	LCD_VER�,W
	CALL	LCD_KOMUT_GONDER
	RETURN
LCD_KOMUT_GONDER
	ANDLW	0X0F
	MOVWF	PORTB
	BCF		PORTB,4
	CALL	GEC�KME
	CALL	LCD_PULSE
	RETURN
LCD_VER�_YAZ
	MOVF	USART_DATA,W
	MOVWF	LCD_VER�
	SWAPF	LCD_VER�,W
	CALL	LCD_VER�_GONDER
	MOVF	LCD_VER�,W
	CALL	LCD_VER�_GONDER
	RETURN
LCD_VER�_GONDER
	ANDLW	0X0F
	MOVWF	PORTB
	BSF		PORTB,4
	CALL	GEC�KME
	CALL	LCD_PULSE
	RETURN
LCD_PULSE
	BSF		PORTB,5
	BCF		PORTB,5
	RETURN
LCD_1SATIR							
	MOVLW	0X80					
	CALL	LCD_KOMUT_YAZ			
	RETURN
LCD_2SATIR
	MOVLW	0XC0
	CALL	LCD_KOMUT_YAZ
	RETURN
LCD_1SATIRW						
	ADDLW		0X80					
	CALL		LCD_KOMUT_YAZ			
	RETURN
LCD_2SATIRW
	ADDLW		0XC0	
	CALL		LCD_KOMUT_YAZ
	RETURN
LCD_CLR
	MOVLW		0X01					
	CALL		LCD_KOMUT_YAZ				
	RETURN

RS232_INIT
	BANKSEL	INTCON
	BSF		INTCON,6
	BCF		INTCON,7
	
	MOVLW	B'10010000'
	MOVWF	RCSTA

	BANKSEL	TXSTA
	MOVLW	B'00100110'
	MOVWF	TXSTA
	MOVLW	0X19
	MOVWF	SPBRG
	BSF		PIE1,RCIE
	BSF		PIE1,TXIE	
	RETURN
RS232_VER�GONDER
	BANKSEL	PIR1
	BTFSS	PIR1,TXIF
	GOTO	$-1
	BCF		PIR1,TXIF
	MOVF	USART_DATA,W
	MOVWF	TXREG
	RETURN
RS232_VER�AL
	BANKSEL	PIR1
	BTFSS	PIR1,RCIF
	GOTO	$-1
	BCF		PIR1,RCIF
	MOVF	RCREG,W
	MOVWF	USART_DATA
	RETURN


GEC�KME
	MOVLW	0XFF
	MOVWF	SAYAC1
DONGU1
	MOVLW	0XFF
	MOVWF	SAYAC2
DONGU2
	DECFSZ	SAYAC2,1
	GOTO	DONGU2
	DECFSZ	SAYAC1,1
	GOTO	DONGU1
	RETURN
	
END
