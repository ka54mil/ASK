;Napisa� program wykorzystuj�cy przerwania klawiatury do sterowania
;ruchem w�a w labiryncie.
;--------------------------------------------------------------------
;Przyk�adowe przyciski do poruszania w�em:
;z - ruch w gor�
;G - ruch w dol
;+ - ruch w lewo
;ctrl+( - ruch w prawo
;--------------------------------------------------------------------
jmp restart
db 9
db 10
db 20
org 9
iret

org 10
	in 07
	out 04
iret

org 20
	in 08
	out 04
iret

restart:
	cli
	out 07
	MOV AL,FF
	out 04
	sti
start:
	cmp al,7a
	jnz start
	jz up
jmp start

up:
	mov al,8f
	out 04
jmp start

end