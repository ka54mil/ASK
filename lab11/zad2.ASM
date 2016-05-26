jmp start
org 03
	db 04
	in 00
	push al
	pop cl
	cmp cl,3A
	jns red
	cmp cl,30
	js red 
iret
red:
	cmp cl, 71
	jnz skipq
	mov cl,fe
skipq:
	cmp cl,51
	jnz skipBigQ
	mov cl,fe
skipBigQ:
	cmp cl,fe
	jz end
	mov cl,ff
	mov al, 10
	out 01
start:
	int 03
	sub cl,30
green:
	cmp cl, 0
	jz next
	js next
	mov al,04
	out 01
	mov al, 00
	out 01
	dec cl
	cmp cl, 0
	jnz green
next:
	jmp start
end:
end