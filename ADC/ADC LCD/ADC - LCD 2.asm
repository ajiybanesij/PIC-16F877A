;  ASM code generated by mikroVirtualMachine for PIC - V. 8.2.0.0
;  Date/Time: 14.12.2010 15:13:34
;  Info: http://www.mikroe.com


; ADDRESS	OPCODE	ASM
; ----------------------------------------------
$0000	$2804			GOTO	_main
$04D3	$	_Delay_1us:
$04D3	$0000			NOP
$04D4	$0000			NOP
$04D5	$0008			RETURN
$049B	$	_Delay_5500us:
$049B	$300F			MOVLW	15
$049C	$1303			BCF	STATUS, RP1
$049D	$1283			BCF	STATUS, RP0
$049E	$00FB			MOVWF	STACK_11
$049F	$30FF			MOVLW	255
$04A0	$00FA			MOVWF	STACK_10
$04A1	$0BFB			DECFSZ	STACK_11, F
$04A2	$2CA4			GOTO	$+2
$04A3	$2CA7			GOTO	$+4
$04A4	$0BFA			DECFSZ	STACK_10, F
$04A5	$2CA4			GOTO	$-1
$04A6	$2CA1			GOTO	$-5
$04A7	$303E			MOVLW	62
$04A8	$00FA			MOVWF	STACK_10
$04A9	$0BFA			DECFSZ	STACK_10, F
$04AA	$2CA9			GOTO	$-1
$04AB	$0000			NOP
$04AC	$0008			RETURN
$04CC	$	_Delay_50us:
$04CC	$3021			MOVLW	33
$04CD	$1303			BCF	STATUS, RP1
$04CE	$1283			BCF	STATUS, RP0
$04CF	$00FA			MOVWF	STACK_10
$04D0	$0BFA			DECFSZ	STACK_10, F
$04D1	$2CD0			GOTO	$-1
$04D2	$0008			RETURN
$04C4	$	_Delay_22us:
$04C4	$300E			MOVLW	14
$04C5	$1303			BCF	STATUS, RP1
$04C6	$1283			BCF	STATUS, RP0
$04C7	$00FA			MOVWF	STACK_10
$04C8	$0BFA			DECFSZ	STACK_10, F
$04C9	$2CC8			GOTO	$-1
$04CA	$0000			NOP
$04CB	$0008			RETURN
$038A	$	_Lcd_Cmd:
$038A	$1303			BCF	STATUS, RP1
$038B	$1283			BCF	STATUS, RP0
$038C	$0821			MOVF	LCD_port_address, 0
$038D	$0084			MOVWF	FSR
$038E	$083C			MOVF	FARG_Lcd_Cmd+0, 0
$038F	$1903			BTFSC	STATUS, Z
$0390	$2B91			GOTO	L_Lcd_Cmd_0
$0391	$	L_Lcd_Cmd_0:
$0391	$1280			BCF	INDF, ___ENABLE
$0392	$1200			BCF	INDF, ___RS
$0393	$1180			BCF	INDF, ___DB7
$0394	$1100			BCF	INDF, ___DB6
$0395	$1080			BCF	INDF, ___DB5
$0396	$1000			BCF	INDF, ___DB4
$0397	$1BBC			BTFSC	FARG_Lcd_Cmd+0, 7
$0398	$1580			BSF	INDF, ___DB7
$0399	$1B3C			BTFSC	FARG_Lcd_Cmd+0, 6
$039A	$1500			BSF	INDF, ___DB6
$039B	$1ABC			BTFSC	FARG_Lcd_Cmd+0, 5
$039C	$1480			BSF	INDF, ___DB5
$039D	$1A3C			BTFSC	FARG_Lcd_Cmd+0, 4
$039E	$1400			BSF	INDF, ___DB4
$039F	$0822			MOVF	LCD_cmd_status, 0
$03A0	$1903			BTFSC	STATUS, Z
$03A1	$2BA4			GOTO	L_Lcd_Cmd_1
$03A2	$1200			BCF	INDF, ___RS
$03A3	$2BA5			GOTO	L_Lcd_Cmd_2
$03A4	$	L_Lcd_Cmd_1:
$03A4	$1600			BSF	INDF, ___RS
$03A5	$	L_Lcd_Cmd_2:
$03A5	$1680			BSF	INDF, ___ENABLE
$03A6	$24D3			CALL	_Delay_1us
$03A7	$083C			MOVF	FARG_Lcd_Cmd+0, 0
$03A8	$1903			BTFSC	STATUS, Z
$03A9	$2BAA			GOTO	L_Lcd_Cmd_3
$03AA	$	L_Lcd_Cmd_3:
$03AA	$1280			BCF	INDF, ___ENABLE
$03AB	$1200			BCF	INDF, ___RS
$03AC	$1180			BCF	INDF, ___DB7
$03AD	$1100			BCF	INDF, ___DB6
$03AE	$1080			BCF	INDF, ___DB5
$03AF	$1000			BCF	INDF, ___DB4
$03B0	$19BC			BTFSC	FARG_Lcd_Cmd+0, 3
$03B1	$1580			BSF	INDF, ___DB7
$03B2	$193C			BTFSC	FARG_Lcd_Cmd+0, 2
$03B3	$1500			BSF	INDF, ___DB6
$03B4	$18BC			BTFSC	FARG_Lcd_Cmd+0, 1
$03B5	$1480			BSF	INDF, ___DB5
$03B6	$183C			BTFSC	FARG_Lcd_Cmd+0, 0
$03B7	$1400			BSF	INDF, ___DB4
$03B8	$0822			MOVF	LCD_cmd_status, 0
$03B9	$1903			BTFSC	STATUS, Z
$03BA	$2BBD			GOTO	L_Lcd_Cmd_4
$03BB	$1200			BCF	INDF, ___RS
$03BC	$2BBE			GOTO	L_Lcd_Cmd_5
$03BD	$	L_Lcd_Cmd_4:
$03BD	$1600			BSF	INDF, ___RS
$03BE	$	L_Lcd_Cmd_5:
$03BE	$1680			BSF	INDF, ___ENABLE
$03BF	$24D3			CALL	_Delay_1us
$03C0	$1280			BCF	INDF, ___ENABLE
$03C1	$0822			MOVF	LCD_cmd_status, 0
$03C2	$1903			BTFSC	STATUS, Z
$03C3	$2BC6			GOTO	L_Lcd_Cmd_6
$03C4	$249B			CALL	_Delay_5500us
$03C5	$2BC7			GOTO	L_Lcd_Cmd_7
$03C6	$	L_Lcd_Cmd_6:
$03C6	$24CC			CALL	_Delay_50us
$03C7	$	L_Lcd_Cmd_7:
$03C7	$0008			RETURN
$043A	$	_Mul_32x32_U:
$043A	$1303			BCF	STATUS, RP1
$043B	$1283			BCF	STATUS, RP0
$043C	$3022			MOVLW	34
$043D	$00FC			MOVWF	STACK_12
$043E	$01F8			CLRF	STACK_8
$043F	$01F9			CLRF	STACK_9
$0440	$01FA			CLRF	STACK_10
$0441	$01FB			CLRF	STACK_11
$0442	$	_NEXT:
$0442	$03FC			DECF	STACK_12, F
$0443	$1903			BTFSC	STATUS, Z
$0444	$2C70			GOTO	_EXIT2
$0445	$1003			BCF	STATUS, C
$0446	$	_LOOP:
$0446	$0CFB			RRF	STACK_11, F
$0447	$0CFA			RRF	STACK_10, F
$0448	$0CF9			RRF	STACK_9, F
$0449	$0CF8			RRF	STACK_8, F
$044A	$0CF3			RRF	STACK_3, F
$044B	$0CF2			RRF	STACK_2, F
$044C	$0CF1			RRF	STACK_1, F
$044D	$0CF0			RRF	STACK_0, F
$044E	$1C03			BTFSS	STATUS, C
$044F	$2C42			GOTO	_NEXT
$0450	$03FC			DECF	STACK_12, F
$0451	$1903			BTFSC	STATUS, Z
$0452	$2C62			GOTO	_EXIT1
$0453	$0874			MOVF	STACK_4, W
$0454	$07F8			ADDWF	STACK_8, F
$0455	$0875			MOVF	STACK_5, W
$0456	$1803			BTFSC	STATUS, C
$0457	$0F75			INCFSZ	STACK_5, W
$0458	$07F9			ADDWF	STACK_9, F
$0459	$0876			MOVF	STACK_6, W
$045A	$1803			BTFSC	STATUS, C
$045B	$0F76			INCFSZ	STACK_6, W
$045C	$07FA			ADDWF	STACK_10, F
$045D	$0877			MOVF	STACK_7, W
$045E	$1803			BTFSC	STATUS, C
$045F	$0F77			INCFSZ	STACK_7, W
$0460	$07FB			ADDWF	STACK_11, F
$0461	$2C46			GOTO	_LOOP
$0462	$	_EXIT1:
$0462	$0874			MOVF	STACK_4, W
$0463	$07F8			ADDWF	STACK_8, F
$0464	$0875			MOVF	STACK_5, W
$0465	$1803			BTFSC	STATUS, C
$0466	$0F75			INCFSZ	STACK_5, W
$0467	$07F9			ADDWF	STACK_9, F
$0468	$0876			MOVF	STACK_6, W
$0469	$1803			BTFSC	STATUS, C
$046A	$0F76			INCFSZ	STACK_6, W
$046B	$07FA			ADDWF	STACK_10, F
$046C	$0877			MOVF	STACK_7, W
$046D	$1803			BTFSC	STATUS, C
$046E	$0F77			INCFSZ	STACK_7, W
$046F	$07FB			ADDWF	STACK_11, F
$0470	$	_EXIT2:
$0470	$0008			RETURN
$0176	$	_SDIV3232L:
$0176	$1303			BCF	STATUS, RP1
$0177	$1283			BCF	STATUS, RP0
$0178	$0874			MOVF	STACK_4, W
$0179	$02F8			SUBWF	STACK_8, F
$017A	$0875			MOVF	STACK_5, W
$017B	$1C03			BTFSS	STATUS, C
$017C	$0F75			INCFSZ	STACK_5, W
$017D	$02F9			SUBWF	STACK_9, F
$017E	$0876			MOVF	STACK_6, W
$017F	$1C03			BTFSS	STATUS, C
$0180	$0F76			INCFSZ	STACK_6, W
$0181	$02FA			SUBWF	STACK_10, F
$0182	$0877			MOVF	STACK_7, W
$0183	$1C03			BTFSS	STATUS, C
$0184	$0F77			INCFSZ	STACK_7, W
$0185	$02FB			SUBWF	STACK_11, F
$0186	$0DF3			RLF	STACK_3, F
$0187	$3007			MOVLW	7
$0188	$00FC			MOVWF	STACK_12
$0189	$	LOOPS3232A:
$0189	$0D73			RLF	STACK_3, W
$018A	$0DF8			RLF	STACK_8, F
$018B	$0DF9			RLF	STACK_9, F
$018C	$0DFA			RLF	STACK_10, F
$018D	$0DFB			RLF	STACK_11, F
$018E	$0874			MOVF	STACK_4, W
$018F	$1C73			BTFSS	STACK_3, 0
$0190	$299F			GOTO	SADD22LA
$0191	$02F8			SUBWF	STACK_8, F
$0192	$0875			MOVF	STACK_5, W
$0193	$1C03			BTFSS	STATUS, C
$0194	$0F75			INCFSZ	STACK_5, W
$0195	$02F9			SUBWF	STACK_9, F
$0196	$0876			MOVF	STACK_6, W
$0197	$1C03			BTFSS	STATUS, C
$0198	$0F76			INCFSZ	STACK_6, W
$0199	$02FA			SUBWF	STACK_10, F
$019A	$0877			MOVF	STACK_7, W
$019B	$1C03			BTFSS	STATUS, C
$019C	$0F77			INCFSZ	STACK_7, W
$019D	$02FB			SUBWF	STACK_11, F
$019E	$29AC			GOTO	SOK22LA
$019F	$	SADD22LA:
$019F	$07F8			ADDWF	STACK_8, F
$01A0	$0875			MOVF	STACK_5, W
$01A1	$1803			BTFSC	STATUS, C
$01A2	$0F75			INCFSZ	STACK_5, W
$01A3	$07F9			ADDWF	STACK_9, F
$01A4	$0876			MOVF	STACK_6, W
$01A5	$1803			BTFSC	STATUS, C
$01A6	$0F76			INCFSZ	STACK_6, W
$01A7	$07FA			ADDWF	STACK_10, F
$01A8	$0877			MOVF	STACK_7, W
$01A9	$1803			BTFSC	STATUS, C
$01AA	$0F77			INCFSZ	STACK_7, W
$01AB	$07FB			ADDWF	STACK_11, F
$01AC	$	SOK22LA:
$01AC	$0DF3			RLF	STACK_3, F
$01AD	$0BFC			DECFSZ	STACK_12, F
$01AE	$2989			GOTO	LOOPS3232A
$01AF	$0D72			RLF	STACK_2, W
$01B0	$0DF8			RLF	STACK_8, F
$01B1	$0DF9			RLF	STACK_9, F
$01B2	$0DFA			RLF	STACK_10, F
$01B3	$0DFB			RLF	STACK_11, F
$01B4	$0874			MOVF	STACK_4, W
$01B5	$1C73			BTFSS	STACK_3, 0
$01B6	$29C5			GOTO	SADD22L8
$01B7	$02F8			SUBWF	STACK_8, F
$01B8	$0875			MOVF	STACK_5, W
$01B9	$1C03			BTFSS	STATUS, C
$01BA	$0F75			INCFSZ	STACK_5, W
$01BB	$02F9			SUBWF	STACK_9, F
$01BC	$0876			MOVF	STACK_6, W
$01BD	$1C03			BTFSS	STATUS, C
$01BE	$0F76			INCFSZ	STACK_6, W
$01BF	$02FA			SUBWF	STACK_10, F
$01C0	$0877			MOVF	STACK_7, W
$01C1	$1C03			BTFSS	STATUS, C
$01C2	$0F77			INCFSZ	STACK_7, W
$01C3	$02FB			SUBWF	STACK_11, F
$01C4	$29D2			GOTO	SOK22L8
$01C5	$	SADD22L8:
$01C5	$07F8			ADDWF	STACK_8, F
$01C6	$0875			MOVF	STACK_5, W
$01C7	$1803			BTFSC	STATUS, C
$01C8	$0F75			INCFSZ	STACK_5, W
$01C9	$07F9			ADDWF	STACK_9, F
$01CA	$0876			MOVF	STACK_6, W
$01CB	$1803			BTFSC	STATUS, C
$01CC	$0F76			INCFSZ	STACK_6, W
$01CD	$07FA			ADDWF	STACK_10, F
$01CE	$0877			MOVF	STACK_7, W
$01CF	$1803			BTFSC	STATUS, C
$01D0	$0F77			INCFSZ	STACK_7, W
$01D1	$07FB			ADDWF	STACK_11, F
$01D2	$	SOK22L8:
$01D2	$0DF2			RLF	STACK_2, F
$01D3	$3007			MOVLW	7
$01D4	$00FC			MOVWF	STACK_12
$01D5	$	LOOPS3232B:
$01D5	$0D72			RLF	STACK_2, W
$01D6	$0DF8			RLF	STACK_8, F
$01D7	$0DF9			RLF	STACK_9, F
$01D8	$0DFA			RLF	STACK_10, F
$01D9	$0DFB			RLF	STACK_11, F
$01DA	$0874			MOVF	STACK_4, W
$01DB	$1C72			BTFSS	STACK_2, 0
$01DC	$29EB			GOTO	SADD22LB
$01DD	$02F8			SUBWF	STACK_8, F
$01DE	$0875			MOVF	STACK_5, W
$01DF	$1C03			BTFSS	STATUS, C
$01E0	$0F75			INCFSZ	STACK_5, W
$01E1	$02F9			SUBWF	STACK_9, F
$01E2	$0876			MOVF	STACK_6, W
$01E3	$1C03			BTFSS	STATUS, C
$01E4	$0F76			INCFSZ	STACK_6, W
$01E5	$02FA			SUBWF	STACK_10, F
$01E6	$0877			MOVF	STACK_7, W
$01E7	$1C03			BTFSS	STATUS, C
$01E8	$0F77			INCFSZ	STACK_7, W
$01E9	$02FB			SUBWF	STACK_11, F
$01EA	$29F8			GOTO	SOK22LB
$01EB	$	SADD22LB:
$01EB	$07F8			ADDWF	STACK_8, F
$01EC	$0875			MOVF	STACK_5, W
$01ED	$1803			BTFSC	STATUS, C
$01EE	$0F75			INCFSZ	STACK_5, W
$01EF	$07F9			ADDWF	STACK_9, F
$01F0	$0876			MOVF	STACK_6, W
$01F1	$1803			BTFSC	STATUS, C
$01F2	$0F76			INCFSZ	STACK_6, W
$01F3	$07FA			ADDWF	STACK_10, F
$01F4	$0877			MOVF	STACK_7, W
$01F5	$1803			BTFSC	STATUS, C
$01F6	$0F77			INCFSZ	STACK_7, W
$01F7	$07FB			ADDWF	STACK_11, F
$01F8	$	SOK22LB:
$01F8	$0DF2			RLF	STACK_2, F
$01F9	$0BFC			DECFSZ	STACK_12, F
$01FA	$29D5			GOTO	LOOPS3232B
$01FB	$0D71			RLF	STACK_1, W
$01FC	$0DF8			RLF	STACK_8, F
$01FD	$0DF9			RLF	STACK_9, F
$01FE	$0DFA			RLF	STACK_10, F
$01FF	$0DFB			RLF	STACK_11, F
$0200	$0874			MOVF	STACK_4, W
$0201	$1C72			BTFSS	STACK_2, 0
$0202	$2A11			GOTO	SADD22L16
$0203	$02F8			SUBWF	STACK_8, F
$0204	$0875			MOVF	STACK_5, W
$0205	$1C03			BTFSS	STATUS, C
$0206	$0F75			INCFSZ	STACK_5, W
$0207	$02F9			SUBWF	STACK_9, F
$0208	$0876			MOVF	STACK_6, W
$0209	$1C03			BTFSS	STATUS, C
$020A	$0F76			INCFSZ	STACK_6, W
$020B	$02FA			SUBWF	STACK_10, F
$020C	$0877			MOVF	STACK_7, W
$020D	$1C03			BTFSS	STATUS, C
$020E	$0F77			INCFSZ	STACK_7, W
$020F	$02FB			SUBWF	STACK_11, F
$0210	$2A1E			GOTO	SOK22L16
$0211	$	SADD22L16:
$0211	$07F8			ADDWF	STACK_8, F
$0212	$0875			MOVF	STACK_5, W
$0213	$1803			BTFSC	STATUS, C
$0214	$0F75			INCFSZ	STACK_5, W
$0215	$07F9			ADDWF	STACK_9, F
$0216	$0876			MOVF	STACK_6, W
$0217	$1803			BTFSC	STATUS, C
$0218	$0F76			INCFSZ	STACK_6, W
$0219	$07FA			ADDWF	STACK_10, F
$021A	$0877			MOVF	STACK_7, W
$021B	$1803			BTFSC	STATUS, C
$021C	$0F77			INCFSZ	STACK_7, W
$021D	$07FB			ADDWF	STACK_11, F
$021E	$	SOK22L16:
$021E	$0DF1			RLF	STACK_1, F
$021F	$3007			MOVLW	7
$0220	$00FC			MOVWF	STACK_12
$0221	$	LOOPS3232C:
$0221	$0D71			RLF	STACK_1, W
$0222	$0DF8			RLF	STACK_8, F
$0223	$0DF9			RLF	STACK_9, F
$0224	$0DFA			RLF	STACK_10, F
$0225	$0DFB			RLF	STACK_11, F
$0226	$0874			MOVF	STACK_4, W
$0227	$1C71			BTFSS	STACK_1, 0
$0228	$2A37			GOTO	SADD22LC
$0229	$02F8			SUBWF	STACK_8, F
$022A	$0875			MOVF	STACK_5, W
$022B	$1C03			BTFSS	STATUS, C
$022C	$0F75			INCFSZ	STACK_5, W
$022D	$02F9			SUBWF	STACK_9, F
$022E	$0876			MOVF	STACK_6, W
$022F	$1C03			BTFSS	STATUS, C
$0230	$0F76			INCFSZ	STACK_6, W
$0231	$02FA			SUBWF	STACK_10, F
$0232	$0877			MOVF	STACK_7, W
$0233	$1C03			BTFSS	STATUS, C
$0234	$0F77			INCFSZ	STACK_7, W
$0235	$02FB			SUBWF	STACK_11, F
$0236	$2A44			GOTO	SOK22LC
$0237	$	SADD22LC:
$0237	$07F8			ADDWF	STACK_8, F
$0238	$0875			MOVF	STACK_5, W
$0239	$1803			BTFSC	STATUS, C
$023A	$0F75			INCFSZ	STACK_5, W
$023B	$07F9			ADDWF	STACK_9, F
$023C	$0876			MOVF	STACK_6, W
$023D	$1803			BTFSC	STATUS, C
$023E	$0F76			INCFSZ	STACK_6, W
$023F	$07FA			ADDWF	STACK_10, F
$0240	$0877			MOVF	STACK_7, W
$0241	$1803			BTFSC	STATUS, C
$0242	$0F77			INCFSZ	STACK_7, W
$0243	$07FB			ADDWF	STACK_11, F
$0244	$	SOK22LC:
$0244	$0DF1			RLF	STACK_1, F
$0245	$0BFC			DECFSZ	STACK_12, F
$0246	$2A21			GOTO	LOOPS3232C
$0247	$0D70			RLF	STACK_0, W
$0248	$0DF8			RLF	STACK_8, F
$0249	$0DF9			RLF	STACK_9, F
$024A	$0DFA			RLF	STACK_10, F
$024B	$0DFB			RLF	STACK_11, F
$024C	$0874			MOVF	STACK_4, W
$024D	$1C71			BTFSS	STACK_1, 0
$024E	$2A5D			GOTO	SADD22L24
$024F	$02F8			SUBWF	STACK_8, F
$0250	$0875			MOVF	STACK_5, W
$0251	$1C03			BTFSS	STATUS, C
$0252	$0F75			INCFSZ	STACK_5, W
$0253	$02F9			SUBWF	STACK_9, F
$0254	$0876			MOVF	STACK_6, W
$0255	$1C03			BTFSS	STATUS, C
$0256	$0F76			INCFSZ	STACK_6, W
$0257	$02FA			SUBWF	STACK_10, F
$0258	$0877			MOVF	STACK_7, W
$0259	$1C03			BTFSS	STATUS, C
$025A	$0F77			INCFSZ	STACK_7, W
$025B	$02FB			SUBWF	STACK_11, F
$025C	$2A6A			GOTO	SOK22L24
$025D	$	SADD22L24:
$025D	$07F8			ADDWF	STACK_8, F
$025E	$0875			MOVF	STACK_5, W
$025F	$1803			BTFSC	STATUS, C
$0260	$0F75			INCFSZ	STACK_5, W
$0261	$07F9			ADDWF	STACK_9, F
$0262	$0876			MOVF	STACK_6, W
$0263	$1803			BTFSC	STATUS, C
$0264	$0F76			INCFSZ	STACK_6, W
$0265	$07FA			ADDWF	STACK_10, F
$0266	$0877			MOVF	STACK_7, W
$0267	$1803			BTFSC	STATUS, C
$0268	$0F77			INCFSZ	STACK_7, W
$0269	$07FB			ADDWF	STACK_11, F
$026A	$	SOK22L24:
$026A	$0DF0			RLF	STACK_0, F
$026B	$3007			MOVLW	7
$026C	$00FC			MOVWF	STACK_12
$026D	$	LOOPS3232D:
$026D	$0D70			RLF	STACK_0, W
$026E	$0DF8			RLF	STACK_8, F
$026F	$0DF9			RLF	STACK_9, F
$0270	$0DFA			RLF	STACK_10, F
$0271	$0DFB			RLF	STACK_11, F
$0272	$0874			MOVF	STACK_4, W
$0273	$1C70			BTFSS	STACK_0, 0
$0274	$2A83			GOTO	SADD22LD
$0275	$02F8			SUBWF	STACK_8, F
$0276	$0875			MOVF	STACK_5, W
$0277	$1C03			BTFSS	STATUS, C
$0278	$0F75			INCFSZ	STACK_5, W
$0279	$02F9			SUBWF	STACK_9, F
$027A	$0876			MOVF	STACK_6, W
$027B	$1C03			BTFSS	STATUS, C
$027C	$0F76			INCFSZ	STACK_6, W
$027D	$02FA			SUBWF	STACK_10, F
$027E	$0877			MOVF	STACK_7, W
$027F	$1C03			BTFSS	STATUS, C
$0280	$0F77			INCFSZ	STACK_7, W
$0281	$02FB			SUBWF	STACK_11, F
$0282	$2A90			GOTO	SOK22LD
$0283	$	SADD22LD:
$0283	$07F8			ADDWF	STACK_8, F
$0284	$0875			MOVF	STACK_5, W
$0285	$1803			BTFSC	STATUS, C
$0286	$0F75			INCFSZ	STACK_5, W
$0287	$07F9			ADDWF	STACK_9, F
$0288	$0876			MOVF	STACK_6, W
$0289	$1803			BTFSC	STATUS, C
$028A	$0F76			INCFSZ	STACK_6, W
$028B	$07FA			ADDWF	STACK_10, F
$028C	$0877			MOVF	STACK_7, W
$028D	$1803			BTFSC	STATUS, C
$028E	$0F77			INCFSZ	STACK_7, W
$028F	$07FB			ADDWF	STACK_11, F
$0290	$	SOK22LD:
$0290	$0DF0			RLF	STACK_0, F
$0291	$0BFC			DECFSZ	STACK_12, F
$0292	$2A6D			GOTO	LOOPS3232D
$0293	$1870			BTFSC	STACK_0, 0
$0294	$2AA3			GOTO	SOK22L
$0295	$0874			MOVF	STACK_4, W
$0296	$07F8			ADDWF	STACK_8, F
$0297	$0875			MOVF	STACK_5, W
$0298	$1803			BTFSC	STATUS, C
$0299	$0F75			INCFSZ	STACK_5, W
$029A	$07F9			ADDWF	STACK_9, F
$029B	$0876			MOVF	STACK_6, W
$029C	$1803			BTFSC	STATUS, C
$029D	$0F76			INCFSZ	STACK_6, W
$029E	$07FA			ADDWF	STACK_10, F
$029F	$0877			MOVF	STACK_7, W
$02A0	$1803			BTFSC	STATUS, C
$02A1	$0F77			INCFSZ	STACK_7, W
$02A2	$07FB			ADDWF	STACK_11, F
$02A3	$	SOK22L:
$02A3	$0008			RETURN
$04AD	$	_COMFREM:
$04AD	$1303			BCF	STATUS, RP1
$04AE	$1283			BCF	STATUS, RP0
$04AF	$09FB			COMF	STACK_11, F
$04B0	$09FA			COMF	STACK_10, F
$04B1	$09F9			COMF	STACK_9, F
$04B2	$09F8			COMF	STACK_8, F
$04B3	$0AF8			INCF	STACK_8, F
$04B4	$1903			BTFSC	STATUS, Z
$04B5	$0AF9			INCF	STACK_9, F
$04B6	$1903			BTFSC	STATUS, Z
$04B7	$0AFA			INCF	STACK_10, F
$04B8	$1903			BTFSC	STATUS, Z
$04B9	$0AFB			INCF	STACK_11, F
$04BA	$0008			RETURN
$0471	$	_Adc_Read:
$0471	$30C0			MOVLW	192
$0472	$1303			BCF	STATUS, RP1
$0473	$1283			BCF	STATUS, RP0
$0474	$009F			MOVWF	ADCON0
$0475	$0839			MOVF	FARG_Adc_Read+0, 0
$0476	$00F0			MOVWF	STACK_0
$0477	$0DF0			RLF	STACK_0, 1
$0478	$1070			BCF	STACK_0, 0
$0479	$0DF0			RLF	STACK_0, 1
$047A	$1070			BCF	STACK_0, 0
$047B	$0870			MOVF	STACK_0, 0
$047C	$049F			IORWF	ADCON0, 1
$047D	$1683			BSF	STATUS, RP0
$047E	$179F			BSF	ADCON1, 7
$047F	$1283			BCF	STATUS, RP0
$0480	$141F			BSF	ADCON0, 0
$0481	$24C4			CALL	_Delay_22us
$0482	$149F			BSF	ADCON0, 1
$0483	$	L_Adc_Read_0:
$0483	$1C9F			BTFSS	ADCON0, 1
$0484	$2C87			GOTO	L_Adc_Read_1
$0485	$0000			NOP
$0486	$2C83			GOTO	L_Adc_Read_0
$0487	$	L_Adc_Read_1:
$0487	$101F			BCF	ADCON0, 0
$0488	$3008			MOVLW	8
$0489	$00F2			MOVWF	STACK_2
$048A	$081E			MOVF	ADRESH, 0
$048B	$00F0			MOVWF	STACK_0
$048C	$01F1			CLRF	STACK_0+1
$048D	$0872			MOVF	STACK_2, 0
$048E	$	L_Adc_Read_2:
$048E	$1903			BTFSC	STATUS, Z
$048F	$2C95			GOTO	L_Adc_Read_3
$0490	$0DF0			RLF	STACK_0, 1
$0491	$0DF1			RLF	STACK_0+1, 1
$0492	$1070			BCF	STACK_0, 0
$0493	$3FFF			ADDLW	255
$0494	$2C8E			GOTO	L_Adc_Read_2
$0495	$	L_Adc_Read_3:
$0495	$1683			BSF	STATUS, RP0
$0496	$081E			MOVF	ADRESL, 0
$0497	$04F0			IORWF	STACK_0, 1
$0498	$3000			MOVLW	0
$0499	$04F1			IORWF	STACK_0+1, 1
$049A	$0008			RETURN
$03C8	$	_Lcd_Chr:
$03C8	$2BDA			GOTO	L_Lcd_Chr_8
$03C9	$	L_Lcd_Chr_10:
$03C9	$3080			MOVLW	128
$03CA	$1303			BCF	STATUS, RP1
$03CB	$1283			BCF	STATUS, RP0
$03CC	$00B9			MOVWF	FARG_Lcd_Chr+0
$03CD	$2BED			GOTO	L_Lcd_Chr_9
$03CE	$	L_Lcd_Chr_11:
$03CE	$30C0			MOVLW	192
$03CF	$00B9			MOVWF	FARG_Lcd_Chr+0
$03D0	$2BED			GOTO	L_Lcd_Chr_9
$03D1	$	L_Lcd_Chr_12:
$03D1	$3094			MOVLW	148
$03D2	$00B9			MOVWF	FARG_Lcd_Chr+0
$03D3	$2BED			GOTO	L_Lcd_Chr_9
$03D4	$	L_Lcd_Chr_13:
$03D4	$30D4			MOVLW	212
$03D5	$00B9			MOVWF	FARG_Lcd_Chr+0
$03D6	$2BED			GOTO	L_Lcd_Chr_9
$03D7	$	L_Lcd_Chr_14:
$03D7	$3080			MOVLW	128
$03D8	$00B9			MOVWF	FARG_Lcd_Chr+0
$03D9	$2BED			GOTO	L_Lcd_Chr_9
$03DA	$	L_Lcd_Chr_8:
$03DA	$1303			BCF	STATUS, RP1
$03DB	$1283			BCF	STATUS, RP0
$03DC	$0839			MOVF	FARG_Lcd_Chr+0, 0
$03DD	$3A01			XORLW	1
$03DE	$1903			BTFSC	STATUS, Z
$03DF	$2BC9			GOTO	L_Lcd_Chr_10
$03E0	$0839			MOVF	FARG_Lcd_Chr+0, 0
$03E1	$3A02			XORLW	2
$03E2	$1903			BTFSC	STATUS, Z
$03E3	$2BCE			GOTO	L_Lcd_Chr_11
$03E4	$0839			MOVF	FARG_Lcd_Chr+0, 0
$03E5	$3A03			XORLW	3
$03E6	$1903			BTFSC	STATUS, Z
$03E7	$2BD1			GOTO	L_Lcd_Chr_12
$03E8	$0839			MOVF	FARG_Lcd_Chr+0, 0
$03E9	$3A04			XORLW	4
$03EA	$1903			BTFSC	STATUS, Z
$03EB	$2BD4			GOTO	L_Lcd_Chr_13
$03EC	$2BD7			GOTO	L_Lcd_Chr_14
$03ED	$	L_Lcd_Chr_9:
$03ED	$033A			DECF	FARG_Lcd_Chr+1, 0
$03EE	$00F0			MOVWF	STACK_0
$03EF	$0839			MOVF	FARG_Lcd_Chr+0, 0
$03F0	$07F0			ADDWF	STACK_0, 1
$03F1	$0870			MOVF	STACK_0, 0
$03F2	$00B9			MOVWF	FARG_Lcd_Chr+0
$03F3	$3001			MOVLW	1
$03F4	$00A2			MOVWF	LCD_cmd_status
$03F5	$0870			MOVF	STACK_0, 0
$03F6	$00BC			MOVWF	FARG_Lcd_Cmd+0
$03F7	$238A			CALL	_Lcd_Cmd
$03F8	$01A2			CLRF	LCD_cmd_status, 1
$03F9	$083B			MOVF	FARG_Lcd_Chr+2, 0
$03FA	$00BC			MOVWF	FARG_Lcd_Cmd+0
$03FB	$238A			CALL	_Lcd_Cmd
$03FC	$3001			MOVLW	1
$03FD	$00A2			MOVWF	LCD_cmd_status
$03FE	$0008			RETURN
$04BB	$	_Lcd_Chr_CP:
$04BB	$1303			BCF	STATUS, RP1
$04BC	$1283			BCF	STATUS, RP0
$04BD	$01A2			CLRF	LCD_cmd_status, 1
$04BE	$0839			MOVF	FARG_Lcd_Chr_CP+0, 0
$04BF	$00BC			MOVWF	FARG_Lcd_Cmd+0
$04C0	$238A			CALL	_Lcd_Cmd
$04C1	$3001			MOVLW	1
$04C2	$00A2			MOVWF	LCD_cmd_status
$04C3	$0008			RETURN
$033E	$	_Lcd_Init:
$033E	$249B			CALL	_Delay_5500us
$033F	$249B			CALL	_Delay_5500us
$0340	$249B			CALL	_Delay_5500us
$0341	$0839			MOVF	FARG_Lcd_Init+0, 0
$0342	$00A1			MOVWF	LCD_port_address
$0343	$0839			MOVF	FARG_Lcd_Init+0, 0
$0344	$0084			MOVWF	FSR
$0345	$1784			BSF	FSR, 7
$0346	$1280			BCF	INDF, ___ENABLE
$0347	$1200			BCF	INDF, ___RS
$0348	$1300			BCF	INDF, ___RW
$0349	$1180			BCF	INDF, ___DB7
$034A	$1100			BCF	INDF, ___DB6
$034B	$1080			BCF	INDF, ___DB5
$034C	$1000			BCF	INDF, ___DB4
$034D	$1384			BCF	FSR, 7
$034E	$1280			BCF	INDF, ___ENABLE
$034F	$1200			BCF	INDF, ___RS
$0350	$1300			BCF	INDF, ___RW
$0351	$1180			BCF	INDF, ___DB7
$0352	$1100			BCF	INDF, ___DB6
$0353	$1080			BCF	INDF, ___DB5
$0354	$1000			BCF	INDF, ___DB4
$0355	$1480			BSF	INDF, ___DB5
$0356	$1400			BSF	INDF, ___DB4
$0357	$1680			BSF	INDF, ___ENABLE
$0358	$1280			BCF	INDF, ___ENABLE
$0359	$249B			CALL	_Delay_5500us
$035A	$1680			BSF	INDF, ___ENABLE
$035B	$1280			BCF	INDF, ___ENABLE
$035C	$249B			CALL	_Delay_5500us
$035D	$1680			BSF	INDF, ___ENABLE
$035E	$1280			BCF	INDF, ___ENABLE
$035F	$249B			CALL	_Delay_5500us
$0360	$1480			BSF	INDF, ___DB5
$0361	$1000			BCF	INDF, ___DB4
$0362	$1680			BSF	INDF, ___ENABLE
$0363	$1280			BCF	INDF, ___ENABLE
$0364	$249B			CALL	_Delay_5500us
$0365	$0180			CLRF	INDF
$0366	$1480			BSF	INDF, ___DB5
$0367	$1680			BSF	INDF, ___ENABLE
$0368	$1280			BCF	INDF, ___ENABLE
$0369	$0180			CLRF	INDF
$036A	$1580			BSF	INDF, ___DB7
$036B	$1680			BSF	INDF, ___ENABLE
$036C	$1280			BCF	INDF, ___ENABLE
$036D	$249B			CALL	_Delay_5500us
$036E	$0180			CLRF	INDF
$036F	$1400			BSF	INDF, ___DB4
$0370	$1680			BSF	INDF, ___ENABLE
$0371	$1280			BCF	INDF, ___ENABLE
$0372	$0180			CLRF	INDF
$0373	$1680			BSF	INDF, ___ENABLE
$0374	$1280			BCF	INDF, ___ENABLE
$0375	$249B			CALL	_Delay_5500us
$0376	$0180			CLRF	INDF
$0377	$1680			BSF	INDF, ___ENABLE
$0378	$1280			BCF	INDF, ___ENABLE
$0379	$1400			BSF	INDF, ___DB4
$037A	$1680			BSF	INDF, ___ENABLE
$037B	$1280			BCF	INDF, ___ENABLE
$037C	$249B			CALL	_Delay_5500us
$037D	$0180			CLRF	INDF
$037E	$1680			BSF	INDF, ___ENABLE
$037F	$1280			BCF	INDF, ___ENABLE
$0380	$1400			BSF	INDF, ___DB4
$0381	$1480			BSF	INDF, ___DB5
$0382	$1500			BSF	INDF, ___DB6
$0383	$1580			BSF	INDF, ___DB7
$0384	$1680			BSF	INDF, ___ENABLE
$0385	$1280			BCF	INDF, ___ENABLE
$0386	$249B			CALL	_Delay_5500us
$0387	$3001			MOVLW	1
$0388	$00A2			MOVWF	LCD_cmd_status
$0389	$0008			RETURN
$03FF	$	_Mul_32x32_S:
$03FF	$1303			BCF	STATUS, RP1
$0400	$1283			BCF	STATUS, RP0
$0401	$01FD			CLRF	STACK_13
$0402	$	_IF_FIRST:
$0402	$1FF3			BTFSS	STACK_3, 7
$0403	$2C11			GOTO	_IF_SECOND
$0404	$	_INVERCE_FIRST:
$0404	$09F0			COMF	STACK_0, F
$0405	$09F1			COMF	STACK_1, F
$0406	$09F2			COMF	STACK_2, F
$0407	$09F3			COMF	STACK_3, F
$0408	$0AF0			INCF	STACK_0, F
$0409	$1903			BTFSC	STATUS, Z
$040A	$0AF1			INCF	STACK_1, F
$040B	$1903			BTFSC	STATUS, Z
$040C	$0AF2			INCF	STACK_2, F
$040D	$1903			BTFSC	STATUS, Z
$040E	$0AF3			INCF	STACK_3, F
$040F	$3081			MOVLW	129
$0410	$07FD			ADDWF	STACK_13, F
$0411	$	_IF_SECOND:
$0411	$1FF7			BTFSS	STACK_7, 7
$0412	$2C1F			GOTO	_MULT
$0413	$	_INBERSE_SECOND:
$0413	$09F4			COMF	STACK_4, F
$0414	$09F5			COMF	STACK_5, F
$0415	$09F6			COMF	STACK_6, F
$0416	$09F7			COMF	STACK_7, F
$0417	$0AF4			INCF	STACK_4, F
$0418	$1903			BTFSC	STATUS, Z
$0419	$0AF5			INCF	STACK_5, F
$041A	$1903			BTFSC	STATUS, Z
$041B	$0AF6			INCF	STACK_6, F
$041C	$1903			BTFSC	STATUS, Z
$041D	$0AF7			INCF	STACK_7, F
$041E	$0AFD			INCF	STACK_13, F
$041F	$	_MULT:
$041F	$243A			CALL	_Mul_32x32_U
$0420	$1C7D			BTFSS	STACK_13, 0
$0421	$2C39			GOTO	_EXIT
$0422	$09F0			COMF	STACK_0, F
$0423	$09F1			COMF	STACK_1, F
$0424	$09F2			COMF	STACK_2, F
$0425	$09F3			COMF	STACK_3, F
$0426	$09F8			COMF	STACK_8, F
$0427	$09F9			COMF	STACK_9, F
$0428	$09FA			COMF	STACK_10, F
$0429	$09FB			COMF	STACK_11, F
$042A	$0AF0			INCF	STACK_0, F
$042B	$1903			BTFSC	STATUS, Z
$042C	$0AF1			INCF	STACK_1, F
$042D	$1903			BTFSC	STATUS, Z
$042E	$0AF2			INCF	STACK_2, F
$042F	$1903			BTFSC	STATUS, Z
$0430	$0AF3			INCF	STACK_3, F
$0431	$1903			BTFSC	STATUS, Z
$0432	$0AF8			INCF	STACK_8, F
$0433	$1903			BTFSC	STATUS, Z
$0434	$0AF9			INCF	STACK_9, F
$0435	$1903			BTFSC	STATUS, Z
$0436	$0AFA			INCF	STACK_10, F
$0437	$1903			BTFSC	STATUS, Z
$0438	$0AFB			INCF	STACK_11, F
$0439	$	_EXIT:
$0439	$0008			RETURN
$02A4	$	_Div_32x32_S:
$02A4	$1303			BCF	STATUS, RP1
$02A5	$1283			BCF	STATUS, RP0
$02A6	$	FXD3232S:
$02A6	$01FC			CLRF	STACK_12
$02A7	$1BF7			BTFSC	STACK_7, 7
$02A8	$0AFC			INCF	STACK_12, F
$02A9	$01FD			CLRF	STACK_13
$02AA	$01FB			CLRF	STACK_11
$02AB	$01FA			CLRF	STACK_10
$02AC	$01F9			CLRF	STACK_9
$02AD	$01F8			CLRF	STACK_8
$02AE	$0873			MOVF	STACK_3, W
$02AF	$0472			IORWF	STACK_2, W
$02B0	$0471			IORWF	STACK_1, W
$02B1	$0470			IORWF	STACK_0, W
$02B2	$1903			BTFSC	STATUS, Z
$02B3	$2B38			GOTO	END_ALL
$02B4	$0873			MOVF	STACK_3, W
$02B5	$0677			XORWF	STACK_7, W
$02B6	$00A0			MOVWF	___math_tempb
$02B7	$1BA0			BTFSC	___math_tempb, 7
$02B8	$09FD			COMF	STACK_13, F
$02B9	$1FF7			BTFSS	STACK_7, 7
$02BA	$2AC6			GOTO	CA3232S
$02BB	$09F4			COMF	STACK_4, F
$02BC	$09F5			COMF	STACK_5, F
$02BD	$09F6			COMF	STACK_6, F
$02BE	$09F7			COMF	STACK_7, F
$02BF	$0AF4			INCF	STACK_4, F
$02C0	$1903			BTFSC	STATUS, Z
$02C1	$0AF5			INCF	STACK_5, F
$02C2	$1903			BTFSC	STATUS, Z
$02C3	$0AF6			INCF	STACK_6, F
$02C4	$1903			BTFSC	STATUS, Z
$02C5	$0AF7			INCF	STACK_7, F
$02C6	$	CA3232S:
$02C6	$1FF3			BTFSS	STACK_3, 7
$02C7	$2AD3			GOTO	C3232SX
$02C8	$09F0			COMF	STACK_0, F
$02C9	$09F1			COMF	STACK_1, F
$02CA	$09F2			COMF	STACK_2, F
$02CB	$09F3			COMF	STACK_3, F
$02CC	$0AF0			INCF	STACK_0, F
$02CD	$1903			BTFSC	STATUS, Z
$02CE	$0AF1			INCF	STACK_1, F
$02CF	$1903			BTFSC	STATUS, Z
$02D0	$0AF2			INCF	STACK_2, F
$02D1	$1903			BTFSC	STATUS, Z
$02D2	$0AF3			INCF	STACK_3, F
$02D3	$	C3232SX:
$02D3	$0873			MOVF	STACK_3, W
$02D4	$0477			IORWF	STACK_7, W
$02D5	$00A0			MOVWF	___math_tempb
$02D6	$1BA0			BTFSC	___math_tempb, 7
$02D7	$2AF4			GOTO	C3232SX1
$02D8	$	C3232S:
$02D8	$2176			CALL	_SDIV3232L
$02D9	$	C3232S2:
$02D9	$1BFC			BTFSC	STACK_12, 7
$02DA	$2B11			GOTO	C3232SX4
$02DB	$	C3232SOK:
$02DB	$1FFD			BTFSS	STACK_13, 7
$02DC	$2B38			GOTO	END_ALL
$02DD	$09F0			COMF	STACK_0, F
$02DE	$09F1			COMF	STACK_1, F
$02DF	$09F2			COMF	STACK_2, F
$02E0	$09F3			COMF	STACK_3, F
$02E1	$0AF0			INCF	STACK_0, F
$02E2	$1903			BTFSC	STATUS, Z
$02E3	$0AF1			INCF	STACK_1, F
$02E4	$1903			BTFSC	STATUS, Z
$02E5	$0AF2			INCF	STACK_2, F
$02E6	$1903			BTFSC	STATUS, Z
$02E7	$0AF3			INCF	STACK_3, F
$02E8	$09F8			COMF	STACK_8, F
$02E9	$09F9			COMF	STACK_9, F
$02EA	$09FA			COMF	STACK_10, F
$02EB	$09FB			COMF	STACK_11, F
$02EC	$0AF8			INCF	STACK_8, F
$02ED	$1903			BTFSC	STATUS, Z
$02EE	$0AF9			INCF	STACK_9, F
$02EF	$1903			BTFSC	STATUS, Z
$02F0	$0AFA			INCF	STACK_10, F
$02F1	$1903			BTFSC	STATUS, Z
$02F2	$0AFB			INCF	STACK_11, F
$02F3	$2B38			GOTO	END_ALL
$02F4	$	C3232SX1:
$02F4	$1FF7			BTFSS	STACK_7, 7
$02F5	$2B0B			GOTO	C3232SX3
$02F6	$1BF3			BTFSC	STACK_3, 7
$02F7	$2B05			GOTO	C3232SX2
$02F8	$0873			MOVF	STACK_3, W
$02F9	$00FB			MOVWF	STACK_11
$02FA	$0872			MOVF	STACK_2, W
$02FB	$00FA			MOVWF	STACK_10
$02FC	$0871			MOVF	STACK_1, W
$02FD	$00F9			MOVWF	STACK_9
$02FE	$0870			MOVF	STACK_0, W
$02FF	$00F8			MOVWF	STACK_8
$0300	$01F3			CLRF	STACK_3
$0301	$01F2			CLRF	STACK_2
$0302	$01F1			CLRF	STACK_1
$0303	$01F0			CLRF	STACK_0
$0304	$2ADB			GOTO	C3232SOK
$0305	$	C3232SX2:
$0305	$01F3			CLRF	STACK_3
$0306	$01F2			CLRF	STACK_2
$0307	$01F1			CLRF	STACK_1
$0308	$01F0			CLRF	STACK_0
$0309	$0AF0			INCF	STACK_0, F
$030A	$3400			RETLW	0x00
$030B	$	C3232SX3:
$030B	$09F3			COMF	STACK_3, F
$030C	$09F2			COMF	STACK_2, F
$030D	$09F1			COMF	STACK_1, F
$030E	$09F0			COMF	STACK_0, F
$030F	$17FC			BSF	STACK_12, 7
$0310	$2AD8			GOTO	C3232S
$0311	$	C3232SX4:
$0311	$0AF8			INCF	STACK_8, F
$0312	$1903			BTFSC	STATUS, Z
$0313	$0AF9			INCF	STACK_9, F
$0314	$1903			BTFSC	STATUS, Z
$0315	$0AFA			INCF	STACK_10, F
$0316	$1903			BTFSC	STATUS, Z
$0317	$0AFB			INCF	STACK_11, F
$0318	$0874			MOVF	STACK_4, W
$0319	$0278			SUBWF	STACK_8, W
$031A	$1D03			BTFSS	STATUS, Z
$031B	$2ADB			GOTO	C3232SOK
$031C	$0875			MOVF	STACK_5, W
$031D	$0279			SUBWF	STACK_9, W
$031E	$1D03			BTFSS	STATUS, Z
$031F	$2ADB			GOTO	C3232SOK
$0320	$0876			MOVF	STACK_6, W
$0321	$027A			SUBWF	STACK_10, W
$0322	$1D03			BTFSS	STATUS, Z
$0323	$2ADB			GOTO	C3232SOK
$0324	$0877			MOVF	STACK_7, W
$0325	$027B			SUBWF	STACK_11, W
$0326	$1D03			BTFSS	STATUS, Z
$0327	$2ADB			GOTO	C3232SOK
$0328	$01FB			CLRF	STACK_11
$0329	$01FA			CLRF	STACK_10
$032A	$01F9			CLRF	STACK_9
$032B	$01F8			CLRF	STACK_8
$032C	$0AF0			INCF	STACK_0, F
$032D	$1903			BTFSC	STATUS, Z
$032E	$0AF1			INCF	STACK_1, F
$032F	$1903			BTFSC	STATUS, Z
$0330	$0AF2			INCF	STACK_2, F
$0331	$1903			BTFSC	STATUS, Z
$0332	$0AF3			INCF	STACK_3, F
$0333	$1FF3			BTFSS	STACK_3, 7
$0334	$2ADB			GOTO	C3232SOK
$0335	$01A0			CLRF	___math_tempb
$0336	$1620			BSF	___math_tempb, 4
$0337	$34FF			RETLW	0xFF
$0338	$	END_ALL:
$0338	$01A0			CLRF	___math_tempb
$0339	$1C7C			BTFSS	STACK_12, 0
$033A	$2B3C			GOTO	avoid_comfrem
$033B	$24AD			CALL	_COMFREM
$033C	$	avoid_comfrem:
$033C	$3F00			ADDLW	0x00
$033D	$0008			RETURN
$0004	$	_main:
;odevLCD.c,9 :: 		void main() {
;odevLCD.c,10 :: 		INTCON = 0;
$0004	$018B			CLRF	INTCON, 1
;odevLCD.c,11 :: 		ANSEL  = 0xFF;
$0005	$30FF			MOVLW	255
$0006	$1703			BSF	STATUS, RP1
$0007	$1683			BSF	STATUS, RP0
$0008	$0088			MOVWF	ANSEL
;odevLCD.c,12 :: 		TRISA  = 0xFF;
$0009	$30FF			MOVLW	255
$000A	$1303			BCF	STATUS, RP1
$000B	$0085			MOVWF	TRISA
;odevLCD.c,13 :: 		ANSELH = 0;
$000C	$1703			BSF	STATUS, RP1
$000D	$0189			CLRF	ANSELH, 1
;odevLCD.c,14 :: 		Lcd_Config(&PORTB, 4, 5, 6, 3, 2, 1, 0);
$000E	$3006			MOVLW	PORTB
$000F	$1303			BCF	STATUS, RP1
$0010	$1283			BCF	STATUS, RP0
$0011	$00B9			MOVWF	FARG_Lcd_Init+0
$0012	$233E			CALL	_Lcd_Init
;odevLCD.c,15 :: 		LCD_Cmd(LCD_CURSOR_OFF);
$0013	$300C			MOVLW	12
$0014	$00BC			MOVWF	FARG_Lcd_Cmd+0
$0015	$238A			CALL	_Lcd_Cmd
;odevLCD.c,18 :: 		ADCON1     = 0x82;
$0016	$3082			MOVLW	130
$0017	$1683			BSF	STATUS, RP0
$0018	$009F			MOVWF	ADCON1
;odevLCD.c,19 :: 		TRISA      = 0xFF;
$0019	$30FF			MOVLW	255
$001A	$0085			MOVWF	TRISA
;odevLCD.c,21 :: 		while (1) {
$001B	$	L_main_0:
;odevLCD.c,22 :: 		adc2  =ADC_read(2);
$001B	$3002			MOVLW	2
$001C	$1283			BCF	STATUS, RP0
$001D	$00B9			MOVWF	FARG_Adc_Read+0
$001E	$2471			CALL	_Adc_Read
$001F	$0870			MOVF	STACK_0, 0
$0020	$1283			BCF	STATUS, RP0
$0021	$00A3			MOVWF	_adc2
$0022	$0871			MOVF	STACK_0+1, 0
$0023	$00A4			MOVWF	_adc2+1
;odevLCD.c,23 :: 		adc1  = ADC_read(3);
$0024	$3003			MOVLW	3
$0025	$00B9			MOVWF	FARG_Adc_Read+0
$0026	$2471			CALL	_Adc_Read
$0027	$0870			MOVF	STACK_0, 0
$0028	$1283			BCF	STATUS, RP0
$0029	$00B1			MOVWF	FLOC_main+0
$002A	$0871			MOVF	STACK_0+1, 0
$002B	$00B2			MOVWF	FLOC_main+1
$002C	$0831			MOVF	FLOC_main+0, 0
$002D	$00A5			MOVWF	_adc1
$002E	$0832			MOVF	FLOC_main+1, 0
$002F	$00A6			MOVWF	_adc1+1
;odevLCD.c,25 :: 		tlong2 = (long)adc2 * 5000;
$0030	$0823			MOVF	_adc2, 0
$0031	$00F0			MOVWF	STACK_0
$0032	$0824			MOVF	_adc2+1, 0
$0033	$00F1			MOVWF	STACK_0+1
$0034	$01F2			CLRF	STACK_0+2
$0035	$01F3			CLRF	STACK_0+3
$0036	$3088			MOVLW	136
$0037	$00F4			MOVWF	STACK_4
$0038	$3013			MOVLW	19
$0039	$00F5			MOVWF	STACK_4+1
$003A	$01F6			CLRF	STACK_4+2
$003B	$01F7			CLRF	STACK_4+3
$003C	$23FF			CALL	_mul_32x32_s
$003D	$0870			MOVF	STACK_0, 0
$003E	$00B5			MOVWF	FLOC_main+4
$003F	$0871			MOVF	STACK_0+1, 0
$0040	$00B6			MOVWF	FLOC_main+5
$0041	$0872			MOVF	STACK_0+2, 0
$0042	$00B7			MOVWF	FLOC_main+6
$0043	$0873			MOVF	STACK_0+3, 0
$0044	$00B8			MOVWF	FLOC_main+7
$0045	$0835			MOVF	FLOC_main+4, 0
$0046	$00A7			MOVWF	_tlong2
$0047	$0836			MOVF	FLOC_main+5, 0
$0048	$00A8			MOVWF	_tlong2+1
$0049	$0837			MOVF	FLOC_main+6, 0
$004A	$00A9			MOVWF	_tlong2+2
$004B	$0838			MOVF	FLOC_main+7, 0
$004C	$00AA			MOVWF	_tlong2+3
;odevLCD.c,26 :: 		tlong1 = (long)adc1 * 5000;
$004D	$0831			MOVF	FLOC_main+0, 0
$004E	$00F0			MOVWF	STACK_0
$004F	$0832			MOVF	FLOC_main+1, 0
$0050	$00F1			MOVWF	STACK_0+1
$0051	$01F2			CLRF	STACK_0+2
$0052	$01F3			CLRF	STACK_0+3
$0053	$3088			MOVLW	136
$0054	$00F4			MOVWF	STACK_4
$0055	$3013			MOVLW	19
$0056	$00F5			MOVWF	STACK_4+1
$0057	$01F6			CLRF	STACK_4+2
$0058	$01F7			CLRF	STACK_4+3
$0059	$23FF			CALL	_mul_32x32_s
$005A	$0870			MOVF	STACK_0, 0
$005B	$00AB			MOVWF	_tlong1
$005C	$0871			MOVF	STACK_0+1, 0
$005D	$00AC			MOVWF	_tlong1+1
$005E	$0872			MOVF	STACK_0+2, 0
$005F	$00AD			MOVWF	_tlong1+2
$0060	$0873			MOVF	STACK_0+3, 0
$0061	$00AE			MOVWF	_tlong1+3
;odevLCD.c,27 :: 		tlong1 = tlong1 / 1023;
$0062	$30FF			MOVLW	255
$0063	$00F4			MOVWF	STACK_4
$0064	$3003			MOVLW	3
$0065	$00F5			MOVWF	STACK_4+1
$0066	$01F6			CLRF	STACK_4+2
$0067	$01F7			CLRF	STACK_4+3
$0068	$22A4			CALL	_div_32x32_s
$0069	$0870			MOVF	STACK_0, 0
$006A	$00B1			MOVWF	FLOC_main+0
$006B	$0871			MOVF	STACK_0+1, 0
$006C	$00B2			MOVWF	FLOC_main+1
$006D	$0872			MOVF	STACK_0+2, 0
$006E	$00B3			MOVWF	FLOC_main+2
$006F	$0873			MOVF	STACK_0+3, 0
$0070	$00B4			MOVWF	FLOC_main+3
$0071	$0831			MOVF	FLOC_main+0, 0
$0072	$00AB			MOVWF	_tlong1
$0073	$0832			MOVF	FLOC_main+1, 0
$0074	$00AC			MOVWF	_tlong1+1
$0075	$0833			MOVF	FLOC_main+2, 0
$0076	$00AD			MOVWF	_tlong1+2
$0077	$0834			MOVF	FLOC_main+3, 0
$0078	$00AE			MOVWF	_tlong1+3
;odevLCD.c,28 :: 		tlong2 = tlong2 / 1023;
$0079	$30FF			MOVLW	255
$007A	$00F4			MOVWF	STACK_4
$007B	$3003			MOVLW	3
$007C	$00F5			MOVWF	STACK_4+1
$007D	$01F6			CLRF	STACK_4+2
$007E	$01F7			CLRF	STACK_4+3
$007F	$0835			MOVF	FLOC_main+4, 0
$0080	$00F0			MOVWF	STACK_0
$0081	$0836			MOVF	FLOC_main+5, 0
$0082	$00F1			MOVWF	STACK_0+1
$0083	$0837			MOVF	FLOC_main+6, 0
$0084	$00F2			MOVWF	STACK_0+2
$0085	$0838			MOVF	FLOC_main+7, 0
$0086	$00F3			MOVWF	STACK_0+3
$0087	$22A4			CALL	_div_32x32_s
$0088	$0870			MOVF	STACK_0, 0
$0089	$00A7			MOVWF	_tlong2
$008A	$0871			MOVF	STACK_0+1, 0
$008B	$00A8			MOVWF	_tlong2+1
$008C	$0872			MOVF	STACK_0+2, 0
$008D	$00A9			MOVWF	_tlong2+2
$008E	$0873			MOVF	STACK_0+3, 0
$008F	$00AA			MOVWF	_tlong2+3
;odevLCD.c,30 :: 		ch1     = tlong1 / 1000;
$0090	$30E8			MOVLW	232
$0091	$00F4			MOVWF	STACK_4
$0092	$3003			MOVLW	3
$0093	$00F5			MOVWF	STACK_4+1
$0094	$01F6			CLRF	STACK_4+2
$0095	$01F7			CLRF	STACK_4+3
$0096	$0831			MOVF	FLOC_main+0, 0
$0097	$00F0			MOVWF	STACK_0
$0098	$0832			MOVF	FLOC_main+1, 0
$0099	$00F1			MOVWF	STACK_0+1
$009A	$0833			MOVF	FLOC_main+2, 0
$009B	$00F2			MOVWF	STACK_0+2
$009C	$0834			MOVF	FLOC_main+3, 0
$009D	$00F3			MOVWF	STACK_0+3
$009E	$22A4			CALL	_div_32x32_s
$009F	$0870			MOVF	STACK_0, 0
$00A0	$00AF			MOVWF	_ch1
;odevLCD.c,31 :: 		LCD_Chr(1,4,48+ch1);
$00A1	$3001			MOVLW	1
$00A2	$00B9			MOVWF	FARG_Lcd_Chr+0
$00A3	$3004			MOVLW	4
$00A4	$00BA			MOVWF	FARG_Lcd_Chr+1
$00A5	$0870			MOVF	STACK_0, 0
$00A6	$3F30			ADDLW	48
$00A7	$00BB			MOVWF	FARG_Lcd_Chr+2
$00A8	$23C8			CALL	_Lcd_Chr
;odevLCD.c,32 :: 		LCD_Chr_CP(',');
$00A9	$302C			MOVLW	44
$00AA	$00B9			MOVWF	FARG_Lcd_Chr_CP+0
$00AB	$24BB			CALL	_Lcd_Chr_CP
;odevLCD.c,33 :: 		ch2     = tlong2 / 1000;
$00AC	$30E8			MOVLW	232
$00AD	$00F4			MOVWF	STACK_4
$00AE	$3003			MOVLW	3
$00AF	$00F5			MOVWF	STACK_4+1
$00B0	$01F6			CLRF	STACK_4+2
$00B1	$01F7			CLRF	STACK_4+3
$00B2	$0827			MOVF	_tlong2, 0
$00B3	$00F0			MOVWF	STACK_0
$00B4	$0828			MOVF	_tlong2+1, 0
$00B5	$00F1			MOVWF	STACK_0+1
$00B6	$0829			MOVF	_tlong2+2, 0
$00B7	$00F2			MOVWF	STACK_0+2
$00B8	$082A			MOVF	_tlong2+3, 0
$00B9	$00F3			MOVWF	STACK_0+3
$00BA	$22A4			CALL	_div_32x32_s
$00BB	$0870			MOVF	STACK_0, 0
$00BC	$00B0			MOVWF	_ch2
;odevLCD.c,34 :: 		LCD_Chr(1,12,48+ch2);
$00BD	$3001			MOVLW	1
$00BE	$00B9			MOVWF	FARG_Lcd_Chr+0
$00BF	$300C			MOVLW	12
$00C0	$00BA			MOVWF	FARG_Lcd_Chr+1
$00C1	$0870			MOVF	STACK_0, 0
$00C2	$3F30			ADDLW	48
$00C3	$00BB			MOVWF	FARG_Lcd_Chr+2
$00C4	$23C8			CALL	_Lcd_Chr
;odevLCD.c,35 :: 		LCD_Chr_CP(',');
$00C5	$302C			MOVLW	44
$00C6	$00B9			MOVWF	FARG_Lcd_Chr_CP+0
$00C7	$24BB			CALL	_Lcd_Chr_CP
;odevLCD.c,37 :: 		ch1    = (tlong1 / 100) % 10;
$00C8	$3064			MOVLW	100
$00C9	$00F4			MOVWF	STACK_4
$00CA	$01F5			CLRF	STACK_4+1
$00CB	$01F6			CLRF	STACK_4+2
$00CC	$01F7			CLRF	STACK_4+3
$00CD	$082B			MOVF	_tlong1, 0
$00CE	$00F0			MOVWF	STACK_0
$00CF	$082C			MOVF	_tlong1+1, 0
$00D0	$00F1			MOVWF	STACK_0+1
$00D1	$082D			MOVF	_tlong1+2, 0
$00D2	$00F2			MOVWF	STACK_0+2
$00D3	$082E			MOVF	_tlong1+3, 0
$00D4	$00F3			MOVWF	STACK_0+3
$00D5	$22A4			CALL	_div_32x32_s
$00D6	$300A			MOVLW	10
$00D7	$00F4			MOVWF	STACK_4
$00D8	$01F5			CLRF	STACK_4+1
$00D9	$01F6			CLRF	STACK_4+2
$00DA	$01F7			CLRF	STACK_4+3
$00DB	$22A4			CALL	_div_32x32_s
$00DC	$0878			MOVF	STACK_8, 0
$00DD	$00F0			MOVWF	STACK_0
$00DE	$0879			MOVF	STACK_9, 0
$00DF	$00F1			MOVWF	STACK_1
$00E0	$087A			MOVF	STACK_10, 0
$00E1	$00F2			MOVWF	STACK_2
$00E2	$087B			MOVF	STACK_11, 0
$00E3	$00F3			MOVWF	STACK_3
$00E4	$0870			MOVF	STACK_0, 0
$00E5	$00AF			MOVWF	_ch1
;odevLCD.c,38 :: 		LCD_Chr(1,6,48+ch1);
$00E6	$3001			MOVLW	1
$00E7	$00B9			MOVWF	FARG_Lcd_Chr+0
$00E8	$3006			MOVLW	6
$00E9	$00BA			MOVWF	FARG_Lcd_Chr+1
$00EA	$0870			MOVF	STACK_0, 0
$00EB	$3F30			ADDLW	48
$00EC	$00BB			MOVWF	FARG_Lcd_Chr+2
$00ED	$23C8			CALL	_Lcd_Chr
;odevLCD.c,39 :: 		ch2    = (tlong2 / 100) % 10;
$00EE	$3064			MOVLW	100
$00EF	$00F4			MOVWF	STACK_4
$00F0	$01F5			CLRF	STACK_4+1
$00F1	$01F6			CLRF	STACK_4+2
$00F2	$01F7			CLRF	STACK_4+3
$00F3	$0827			MOVF	_tlong2, 0
$00F4	$00F0			MOVWF	STACK_0
$00F5	$0828			MOVF	_tlong2+1, 0
$00F6	$00F1			MOVWF	STACK_0+1
$00F7	$0829			MOVF	_tlong2+2, 0
$00F8	$00F2			MOVWF	STACK_0+2
$00F9	$082A			MOVF	_tlong2+3, 0
$00FA	$00F3			MOVWF	STACK_0+3
$00FB	$22A4			CALL	_div_32x32_s
$00FC	$300A			MOVLW	10
$00FD	$00F4			MOVWF	STACK_4
$00FE	$01F5			CLRF	STACK_4+1
$00FF	$01F6			CLRF	STACK_4+2
$0100	$01F7			CLRF	STACK_4+3
$0101	$22A4			CALL	_div_32x32_s
$0102	$0878			MOVF	STACK_8, 0
$0103	$00F0			MOVWF	STACK_0
$0104	$0879			MOVF	STACK_9, 0
$0105	$00F1			MOVWF	STACK_1
$0106	$087A			MOVF	STACK_10, 0
$0107	$00F2			MOVWF	STACK_2
$0108	$087B			MOVF	STACK_11, 0
$0109	$00F3			MOVWF	STACK_3
$010A	$0870			MOVF	STACK_0, 0
$010B	$00B0			MOVWF	_ch2
;odevLCD.c,40 :: 		LCD_Chr(1,14,48+ch2);
$010C	$3001			MOVLW	1
$010D	$00B9			MOVWF	FARG_Lcd_Chr+0
$010E	$300E			MOVLW	14
$010F	$00BA			MOVWF	FARG_Lcd_Chr+1
$0110	$0870			MOVF	STACK_0, 0
$0111	$3F30			ADDLW	48
$0112	$00BB			MOVWF	FARG_Lcd_Chr+2
$0113	$23C8			CALL	_Lcd_Chr
;odevLCD.c,42 :: 		ch1    = (tlong1 / 10) % 10;
$0114	$300A			MOVLW	10
$0115	$00F4			MOVWF	STACK_4
$0116	$01F5			CLRF	STACK_4+1
$0117	$01F6			CLRF	STACK_4+2
$0118	$01F7			CLRF	STACK_4+3
$0119	$082B			MOVF	_tlong1, 0
$011A	$00F0			MOVWF	STACK_0
$011B	$082C			MOVF	_tlong1+1, 0
$011C	$00F1			MOVWF	STACK_0+1
$011D	$082D			MOVF	_tlong1+2, 0
$011E	$00F2			MOVWF	STACK_0+2
$011F	$082E			MOVF	_tlong1+3, 0
$0120	$00F3			MOVWF	STACK_0+3
$0121	$22A4			CALL	_div_32x32_s
$0122	$300A			MOVLW	10
$0123	$00F4			MOVWF	STACK_4
$0124	$01F5			CLRF	STACK_4+1
$0125	$01F6			CLRF	STACK_4+2
$0126	$01F7			CLRF	STACK_4+3
$0127	$22A4			CALL	_div_32x32_s
$0128	$0878			MOVF	STACK_8, 0
$0129	$00F0			MOVWF	STACK_0
$012A	$0879			MOVF	STACK_9, 0
$012B	$00F1			MOVWF	STACK_1
$012C	$087A			MOVF	STACK_10, 0
$012D	$00F2			MOVWF	STACK_2
$012E	$087B			MOVF	STACK_11, 0
$012F	$00F3			MOVWF	STACK_3
$0130	$0870			MOVF	STACK_0, 0
$0131	$00AF			MOVWF	_ch1
;odevLCD.c,43 :: 		LCD_Chr(1,7,48+ch1);
$0132	$3001			MOVLW	1
$0133	$00B9			MOVWF	FARG_Lcd_Chr+0
$0134	$3007			MOVLW	7
$0135	$00BA			MOVWF	FARG_Lcd_Chr+1
$0136	$0870			MOVF	STACK_0, 0
$0137	$3F30			ADDLW	48
$0138	$00BB			MOVWF	FARG_Lcd_Chr+2
$0139	$23C8			CALL	_Lcd_Chr
;odevLCD.c,44 :: 		LCD_Chr_CP('V');
$013A	$3056			MOVLW	86
$013B	$00B9			MOVWF	FARG_Lcd_Chr_CP+0
$013C	$24BB			CALL	_Lcd_Chr_CP
;odevLCD.c,45 :: 		ch2    = (tlong2 / 10) % 10;
$013D	$300A			MOVLW	10
$013E	$00F4			MOVWF	STACK_4
$013F	$01F5			CLRF	STACK_4+1
$0140	$01F6			CLRF	STACK_4+2
$0141	$01F7			CLRF	STACK_4+3
$0142	$0827			MOVF	_tlong2, 0
$0143	$00F0			MOVWF	STACK_0
$0144	$0828			MOVF	_tlong2+1, 0
$0145	$00F1			MOVWF	STACK_0+1
$0146	$0829			MOVF	_tlong2+2, 0
$0147	$00F2			MOVWF	STACK_0+2
$0148	$082A			MOVF	_tlong2+3, 0
$0149	$00F3			MOVWF	STACK_0+3
$014A	$22A4			CALL	_div_32x32_s
$014B	$300A			MOVLW	10
$014C	$00F4			MOVWF	STACK_4
$014D	$01F5			CLRF	STACK_4+1
$014E	$01F6			CLRF	STACK_4+2
$014F	$01F7			CLRF	STACK_4+3
$0150	$22A4			CALL	_div_32x32_s
$0151	$0878			MOVF	STACK_8, 0
$0152	$00F0			MOVWF	STACK_0
$0153	$0879			MOVF	STACK_9, 0
$0154	$00F1			MOVWF	STACK_1
$0155	$087A			MOVF	STACK_10, 0
$0156	$00F2			MOVWF	STACK_2
$0157	$087B			MOVF	STACK_11, 0
$0158	$00F3			MOVWF	STACK_3
$0159	$0870			MOVF	STACK_0, 0
$015A	$00B0			MOVWF	_ch2
;odevLCD.c,46 :: 		LCD_Chr(1,15,48+ch2);
$015B	$3001			MOVLW	1
$015C	$00B9			MOVWF	FARG_Lcd_Chr+0
$015D	$300F			MOVLW	15
$015E	$00BA			MOVWF	FARG_Lcd_Chr+1
$015F	$0870			MOVF	STACK_0, 0
$0160	$3F30			ADDLW	48
$0161	$00BB			MOVWF	FARG_Lcd_Chr+2
$0162	$23C8			CALL	_Lcd_Chr
;odevLCD.c,47 :: 		LCD_Chr_CP('V');
$0163	$3056			MOVLW	86
$0164	$00B9			MOVWF	FARG_Lcd_Chr_CP+0
$0165	$24BB			CALL	_Lcd_Chr_CP
;odevLCD.c,48 :: 		Delay_ms(1);
$0166	$3003			MOVLW	3
$0167	$00FB			MOVWF	STACK_11
$0168	$30FF			MOVLW	255
$0169	$00FA			MOVWF	STACK_10
$016A	$0BFB			DECFSZ	STACK_11, F
$016B	$296D			GOTO	$+2
$016C	$2970			GOTO	$+4
$016D	$0BFA			DECFSZ	STACK_10, F
$016E	$296D			GOTO	$-1
$016F	$296A			GOTO	$-5
$0170	$3096			MOVLW	150
$0171	$00FA			MOVWF	STACK_10
$0172	$0BFA			DECFSZ	STACK_10, F
$0173	$2972			GOTO	$-1
;odevLCD.c,49 :: 		}
$0174	$281B			GOTO	L_main_0
;odevLCD.c,50 :: 		}
$0175	$2975			GOTO	$