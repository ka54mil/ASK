;Napisaæ program obs³uguj¹cy przerwania sprzêtowe klawiatury znakowej
;i numerycznej, i wstawiaj¹cy odczytane znaki na kolejn¹ woln¹ pozycjê wy-
;œwietlacza VDU. Po naciœniêciu przycisku „Enter” dodawanie rozpoczyna siê
;od nowej linii (pocz¹tku kolejnej linii), a naciœniêcie przycisku „Backspace”
;powoduje usuniêcie ostatnio wprowadzonego znaku lub przejœcie na koniec
;linii wy¿ej. Nale¿y zabezpieczyæ program przed wyjœciem poza komórki pamiêci
;przeznaczone dla wyœwietlacza. Opcjonalnie mo¿na dodaæ wyœwietlanie
;kursora.
;-------------------------------------------------------------------------------
jmp restart
db 06
db 9
db 1A

org 06
	nop
iret

org 9
	mov al,20
	mov [cl],al
	in 07
			;cmp al,0d
			;jz enter
			;cmp al,08
	call 2B		;jz backspace
	mov [cl],al
	inc cl
iret

org 1A
	mov al,20
	mov [cl],al
	in 08
			;cmp al,0d
			;jz enter
			;cmp al,08
	call 2B		;jz backspace
	mov [cl],al
	inc cl
iret

org 2B
	cmp al,0d
	jz enter
	cmp al,08
	jz backspace
iret

restart:
	cli
	out 07
	out 08
	mov cl,c0
	sti
start:
	mov al,5f
	mov [cl],al
	mov al,20
	mov [cl],al
jmp start

enter:
	pop dl
	cmp cl,d0
	js case1
	cmp cl,e0
	js case2
	cmp cl,f0
	js case3
	mov cl,c0
iret
	case1:
		mov cl,d0
	iret
	case2:
		mov cl,e0
	iret
	case3:
		mov cl,f0
	iret

backspace:
	pop dl
	dec cl
	push al
	mov al,20
	mov [cl],al
	pop al
	pop bl
	cmp cl,c0
	js restart
	jmp start
iret

end