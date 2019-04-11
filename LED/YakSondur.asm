list 			p=16F877
include 		"p16f877.inc"

cblock		0x20
sayac0
sayac1
sayac2
endc

ORG			0
anaprogram
			banksel			TRISC
			clrf   			TRISC
			banksel			PORTC
			clrf 				PORTC
			btfss				PORTC,0
			call				yak
			call				sondur
yak
			bsf				PORTC,0
			movlw			d'10'
			call    			gecikme
sondur
			bcf				PORTC,0
			movlw			d'10'
			call    			gecikme
			goto				yak

;GEC�KMEN�N HESAPLANMASI:
;decfsz ve goto toplam 3 komut �evriminde icra edilir.
;8 Mhz lik bir kristalin 1 komutuicra s�resi 0.5 mikrosn oldu�una g�re 3 komut 1,5 mikrosn de icra edilir.
;255 kez sayac2 azalt�laca��ndan toplam 255x1.5=382mikrosn bekler.
;sayac1 de 255 kez azalt�lacak o halde 255x382.5=97,5milisn yani yakla��k 0.1sn eder.
;O halde verdi�imiz parametre neyse parametrex97.5milisn kadar program bekler.
;Bu �rnekte parametre 10 oldu�u i�in program 975 milisn lik bir bekleme ile �al���r.
gecikme
			movwf			sayac0
dongu0
			movlw			d'255'
			movwf			sayac1
dongu1
			movlw			d'255'
			movwf			sayac2
dongu2
			decfsz			sayac2,F
			goto				dongu2
			decfsz			sayac1
			goto				dongu1
			decfsz			sayac0
			goto				dongu0
			return
END 