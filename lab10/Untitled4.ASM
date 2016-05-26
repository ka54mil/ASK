mov al,ff			;for w prawo loop w dol while w gore
out 04
mov bl, 00
mov al, 4f
loop:	
	out 04
	inc bl
	cmp bl,9
	jnz loop
out 04
mov al,47
out 04
mov al,1f
mov bl, 00
for:
	out 04
	inc bl
	cmp bl,3
	jnz for
mov bl, 00
mov al,8f
while:
	out 04
	inc bl
	cmp bl,5
	jnz while
mov al,1f
mov bl, 00
fora:
	out 04
	inc bl
	cmp bl,3
	jnz fora
mov bl,00
mov al,4f
loopa:	
	out 04
	inc bl
	cmp bl,5
	jnz loopa
mov al,1f
mov bl, 00

forb:
	out 04
	inc bl
	cmp bl,2
	jnz forb
mov bl, 00
mov al,8f
whilea:
	out 04
	inc bl
	cmp bl,8
	jnz whilea
mov bl, 00
mov al,2f
left:
	out 04
	inc bl
	cmp bl,5
	jnz left
mov bl, 00
mov al,8f
whileb:
	out 04
	inc bl
	cmp bl,2
	jnz whileb
mov al,1f
mov bl, 00
	forc:
	out 04
	inc bl
	cmp bl,7
	jnz forc
mov al, 19
out 04
mov bl, 00
mov al, 4f
loopb:	
	out 04
	inc bl
	cmp bl,9
	jnz loopb
out 04
end