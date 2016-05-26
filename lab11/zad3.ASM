; Odczytaj
MOV CL, 70
MOV DL, 70
loop_while:
	IN 00
	CMP AL, 0D
	JZ end_loop
	MOV [CL], AL
	INC CL
	CMP CL, 75
	JNZ skip_if
		MOV CL, 70
	skip_if:

	CMP CL, DL
	JNZ skip_if2
		INC DL
		CMP DL, 75
		JNZ skip_if3
			MOV DL, 70
		skip_if3:
	skip_if2:


	JMP loop_while
end_loop:
; Oblicz dlugosc bufora
CMP CL, DL
JS bif_else
	PUSH CL
	POP BL
	SUB BL, DL
	JMP bif_after
bif_else:
	MOV BL, 5
bif_after:


MOV AL, C0
cloop:
	MOV CL, [DL]
	MOV [AL], CL
	DEC BL
	INC AL
	INC DL
	CMP DL, 75
	JNZ cif_skip
	   MOV DL, 70
	cif_skip:
	CMP BL, 0
	JNZ cloop
END