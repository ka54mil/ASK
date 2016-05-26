jmp start
org 0d
db 10
org 10
	PUSH AL
	MOV AL, 10
	OUT 01
	POP AL
	MOV AL, FF
	PUSH AL
	POPF
iret
error:
	int 0d
start:
	in 00
	sub al,30
	push al
	pop bl
	cmp bl,0
	jz error
	in 00
	sub al,30
	div al,bl
	jno start
end