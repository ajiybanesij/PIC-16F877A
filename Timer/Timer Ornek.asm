 LIST P=16f877a
#INCLUDE <P16F877A.INC>
SAYAC		EQU		0X21
SAYAC1		EQU		0X22

			ORG		0X00
			CALL	HAZIRLA
		
			GOTO	LOOP
			ORG		0X04
			CALL	KESME
LOOP
		
			NOP
			NOP

			GOTO	LOOP

KESME
			
			BCF		INTCON,GIE
			
			BTFSC	INTCON,T0IF
			CALL	ZAMANLAYICI_0
		
			BTFSC	PIR1,TMR1IF
			CALL	ZAMANLAYICI_1
		
			BSF		INTCON,GIE
RETURN
		
HAZIRLA
			CLRF	PORTD
			CLRF	PORTC
	      	BANKSEL	TRISC
			CLRF	TRISC
			CLRF	TRISD

			BSF		STATUS,RP0

 ;        	BCF		INTCON,T0IF
;			BSF		INTCON,T0IE
;			BSF		INTCON,PEIE
;			BSF		INTCON,GIE
	
			MOVLW	B'10000100'
			MOVWF	OPTION_REG
	
		    BCF	STATUS,RP0

			MOVLW	D'5'
			MOVWF	SAYAC
		   
			MOVLW	D'6'
			MOVWF	TMR0

		
			
			
			MOVLW	B'11010000'
			MOVWF	INTCON
			
			BSF		STATUS,RP0

			BSF		PIR1,TMR1IF
			BSF		PIE1,TMR1IE
		
			BCF		STATUS,RP0
		
			MOVLW	B'00100001'
			MOVWF	T1CON
			
			MOVLW	0X3C
			MOVWF	TMR1H
			MOVLW	0XB0
			MOVWF	TMR1L
		
			MOVLW	D'10'
			MOVWF	SAYAC1
			
			CLRF	PORTD
	CLRF	PORTC
RETURN
ZAMANLAYICI_0
		
			DECFSZ	SAYAC,F
			GOTO	L1

			INCF	PORTC,F

			MOVLW	D'5'
			MOVWF	SAYAC
L1

			BCF		INTCON,T0IF
		
			MOVLW	D'6'
			MOVWF	TMR0
			
RETURN

ZAMANLAYICI_1
	
			DECFSZ	SAYAC1,F
			GOTO	L2
			
			INCF	PORTD,F
			
			MOVLW	D'10'
			MOVWF	SAYAC1
L2
			BCF		PIR1,TMR1IF
			
			MOVLW	0X3C
			MOVWF	TMR1H
		
			MOVLW	0XB0
			MOVWF	TMR1L
RETFIE

END
