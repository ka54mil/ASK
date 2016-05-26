loop:
	mov al, 8
	out 5
	mov al,4
	out 5
	mov al,2
	out 5
	mov al,1
	out 5
	cmp al, f
	jnz loop

end