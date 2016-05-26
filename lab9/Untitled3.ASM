jmp start

org 10
pop dl
for:
	
	pop cl	
	cmp cl, 43
	jz finish
	mov [bl],cl
	inc bl
	cmp bl, 0D
	jz finish
	jnz for

		
ret
	
org 30

Rep:
	in 00
	jz end
	push al
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