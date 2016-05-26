jmp start

org 10

Rep:
	in 00
	
	push al
	cmp AL,0D
	jz end
	jnz  Rep
ret

org 30
pop dl
fora:
	
	pop cl	
	cmp cl, 7b
	jns fora
	cmp cl, 60
	js fora
	jz fora
	sub cl, 32
	jmp fora
ret

org 50
pop dl
for:
	
	pop cl	
	cmp cl, 66
	jz next
	mov [bl],cl
	inc bl
	jnz for		
ret

start:
MOV bl, c0
call 10
end:
call 30
next:
call 50
finish:
END