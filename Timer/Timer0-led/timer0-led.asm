LIST P=16F877A
#INCLUDE <P16F877A.INC>
SAYAC EQU 0X20
SAYAC1 EQU 0X21
SAYAC2 EQU 0X22

ORG 0X00
GOTO MAIN

ORG 0X04
GOTO KESME


KESME
BCF INTCON,2
MOVLW D'6'
MOVWF TMR0   ;250*6*125
INCF SAYAC,F
MOVLW D'125'
SUBWF SAYAC,W
BTFSS STATUS,Z
RETFIE
CLRF SAYAC
COMF PORTB
RETFIE

MAIN
BANKSEL TRISB
CLRF TRISB
BANKSEL PORTB
CLRF PORTB

BANKSEL TMR0
MOVLW D'6'
MOVWF TMR0

BANKSEL OPTION_REG
MOVLW B'10000100'
MOVWF OPTION_REG
BANKSEL INTCON
BSF INTCON,GIE
BSF INTCON,T0IE

BSF PORTB,0

DON
GOTO DON


END