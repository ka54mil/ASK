mov al, 0	;al=0

while:
	add al,3	
	cmp al,3F
	jz while
	js while
END

