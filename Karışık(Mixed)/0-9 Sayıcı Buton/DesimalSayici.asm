LIST P=16F877A
#INCLUDE <P16F877A.INC>
SAYAC EQU 0X20
SAYAC1 EQU 0X21
SAYAC2 EQU 0X22
ORG 0X00
GOTO MAIN

MAIN
BANKSEL ADCON1
MOVLW H'06'
MOVWF ADCON1

BANKSEL TRISA
MOVLW 0XFF
MOVWF TRISA
CLRF TRISB

BANKSEL PORTB
CLRF PORTB
MOVLW D'10'
MOVWF SAYAC

KONTROL
BTFSC PORTA,0
GOTO AZALT
GOTO KONTROL


AZALT
DECFSZ SAYAC,F
GOTO YAK
GOTO SIFIRLA


SIFIRLA
MOVLW D'0'
MOVWF PORTB
MOVLW D'10'
MOVWF SAYAC
GOTO SONSUZ


YAK
MOVF SAYAC,W
MOVWF PORTB
GOTO SONSUZ


SONSUZ
BTFSS PORTA,0
GOTO KONTROL
GOTO SONSUZ

; E�er artt�rmada olsa bir s�f�rla birde 9 yapan alt 
; program olurdu ve sublw 9 ve sublw 0 kontrolu yap�l�rd�
; ve decf ve incf komutlar� kullan�l�rd�
END