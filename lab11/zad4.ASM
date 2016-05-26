jmp start
org 05
db 50
enter:
	cmp cl,d0
	js case1
	cmp cl,e0
	js case2
	cmp cl,f0
	js case3
	mov cl,c0
iret
	case1:
		mov cl,d0
	iret
	case2:
		mov cl,e0
	iret
	case3:
		mov cl,f0
	iret
backspace:
	dec cl
	mov [cl],dl
	pop bl
	jmp start2

org 50
	in 00
	cmp al,0d
	jz enter
	cmp al,08
	jz backspace
iret
start:
	mov dl,20
	mov cl,c0
start2:
	int 05
	cmp al,0d
	jz start2
	mov [cl],al
	inc cl
	jmp start2
end
