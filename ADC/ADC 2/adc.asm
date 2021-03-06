#INCLUDE <P16F877.INC>
	
ADC_DATA		EQU		0X21
SAYAC_GECIK1	EQU		0X29	
SAYAC_GECIK2 	EQU		0X30
	ORG 	0X00	
ANA_PROGRAM	
	BANKSEL	TRISA
	MOVLW	0XFF
	MOVWF	TRISA
	CLRF	TRISB
	CLRF	TRISD
	CALL	ADC_INIT
MAIN
	CALL	GECIKME
	CALL	ADC_OKU
	GOTO	MAIN

ADC_OKU
	BANKSEL	ADCON0
	BSF		ADCON0,2
WAIT
	BTFSC 	ADCON0,2
	GOTO 	WAIT
	
	BANKSEL	ADRESH
	MOVF	ADRESH,0
	BANKSEL	PORTD
	MOVWF	PORTD
	BANKSEL	ADRESL
	MOVF	ADRESL,0
	BANKSEL	PORTD
	MOVWF	PORTB
	RETURN

ADC_INIT
	BANKSEL	ADCON1
	MOVLW	B'10000000'
	MOVWF	ADCON1

	BANKSEL	ADCON0
	MOVLW	B'10000001'
	MOVWF	ADCON0
	RETURN

GECIKME
	MOVLW	H'FF'
	MOVWF	SAYAC_GECIK1
DONGU1
	MOVLW	H'FF'
	MOVWF	SAYAC_GECIK2
DONGU2
	DECFSZ	SAYAC_GECIK2,F
	GOTO	DONGU2
	DECFSZ	SAYAC_GECIK1,F
	GOTO	DONGU1
	RETURN
END