jmp start

org 10
pop dl
for:
	
	pop cl	
	cmp cl, 43
	jz finish
	mov [bl],cl
	dec bl
	jnz for

		
ret
	
org 30

Rep:
	in 00
	
	push al
	inc bl
	cmp AL,0D
	jz end
	jnz  Rep
ret

start:
MOV bl, c0
call 30

end:
call 10
finish:
END