;Napisa� program, kt�ry steruje grza�k� w taki spos�b, aby uzyska� sta��
;temperatur�. Jednocze�nie program odlicza w spos�b ci�g�y (�przekr�cenie
;licznika�) od 9 do 0 na wy�wietlaczu VDU. Zmiana cyfry na wy�wietlaczu
;ma by� zrealizowana jako procedura obs�ugi przerwania zegara.
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