#INCLUDE <P16F877.INC>

	SAYAC	EQU		0X21
	ORG 	0X00
	GOTO	START
	ORG 	0X04
	GOTO 	KESME
START
	MOVLW 	B'11000000'  
	MOVWF 	INTCON
	BSF		STATUS,RP0
	MOVLW 	B'00000001'
	MOVWF 	PIE1                     
	CLRF	TRISC
	BCF		STATUS,RP0
	MOVLW   B'00100001'                      
	MOVWF 	T1CON
	MOVLW 	D'1'
	MOVWF 	SAYAC
	MOVLW 	H'15'
	MOVWF 	TMR1H
	MOVLW 	H'A0'
	MOVWF 	TMR1L
	MOVLW	0X01
	MOVWF	PORTC
	GOTO	DON
KESME
	DECFSZ	SAYAC,1
	GOTO	DENE
	GOTO	YAK

DENE
	BANKSEL	PIR1
	BCF	  	PIR1,0
	MOVLW 	H'15'
	MOVWF 	TMR1H
	MOVLW 	H'A0'
	MOVWF 	TMR1L
	RETFIE
YAK	
	BANKSEL	PIR1
	BCF	  	PIR1,0
	RLF		PORTC,1
	MOVLW 	H'15'
	MOVWF 	TMR1H
	MOVLW 	H'A0'
	MOVWF 	TMR1L
	MOVLW	D'1'
	MOVWF	SAYAC
	RETFIE
DON
	GOTO	DON
END