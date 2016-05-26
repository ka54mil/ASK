
in 03
and al,1
jz cold
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