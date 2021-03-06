INCLUDE "P16F877.INC"

__config H'3F31'

TMR0SAY EQU 0X25

ORG 0X00

CLRF PCLATH
GOTO ANA_PROG

ORG 0X04 ; KESME VEKTOR ADRESI

INTERRUPT

BTFSS INTCON,0X05
GOTO INT_J1
BTFSS INTCON,0X02; TIMER0 KESMESI OLUSTUMU
GOTO INT_J1

MOVLW 0Xff
MOVWF TMR0

BCF INTCON,0X02 

INCF TMR0SAY,F
MOVf TMR0SAY,W

SUBLW 0X0E

BTFSS STATUS,C
CLRF TMR0SAY
MOVF TMR0SAY,W
MOVWF PORTB

BTFSS PORTB,0

INT_J1
 RETFIE

ILK_ISLEM

CLRF TMR0SAY

BANKSEL OPTION_REG
MOVLW 0XD2
MOVWF OPTION_REG

BCF TRISB,0 ;

MOVLW 0XFF
MOVWF TRISA

BANKSEL PORTB
CLRF PORTB

MOVLW 0XFF
MOVWF TMR0
CLRF TMR0SAY

BSF INTCON ,0X06 ;TMR0 KESMESI IZIN VERILDI
BSF INTCON ,0X07 ; ETKIN HALDEKI TUM KESMELERE IZIN VERILIR

RETURN

ANA_PROG
CALL ILK_ISLEM

ANA_J1
GOTO ANA_J1

END

