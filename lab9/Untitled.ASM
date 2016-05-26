start:
mov bl, f4

Rep:
	in 00
	MOV [BL], AL
	inc BL
	CMP BL, 00
	jz start
	JNZ REP


END