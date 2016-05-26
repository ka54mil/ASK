;Napisaæ program, który steruje grza³k¹ w taki sposób, aby uzyskaæ sta³¹
;temperaturê. Jednoczeœnie program odlicza w sposób ci¹g³y („przekrêcenie
;licznika”) od 9 do 0 na wyœwietlaczu VDU. Zmiana cyfry na wyœwietlaczu
;ma byæ zrealizowana jako procedura obs³ugi przerwania zegara.
;------------------------------------------------------------------------

jmp start
db 10

org 10
	mov bl,c0
	mov [bl],cl
	dec cl
	cmp cl,2f
	jz rep
iret

start:
	cli
	sti
rep:
	mov cl,39
	in 03
	and al,1
	jnz heat
cold:
	mov al, 80
	out 03
	in 03
	and al,1
	jz cold
	jnz heat
heat:
	mov al, 00
	out 03
	in 03
	and al,1
	jz cold
	jnz heat
end