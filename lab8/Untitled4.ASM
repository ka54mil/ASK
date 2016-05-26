MOV al, 0
mov bl, 1

for:
	push al
	add al, bl
	pop bl
	jno for
END