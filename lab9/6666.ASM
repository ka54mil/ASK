
MOV BL, 0

ret:
	IN 00
	CMP AL, 0D
	JZ end
	SUB AL, 30
	ADD BL, AL
	JMP ret
end:
MOV CL, C0
ADD BL, 30
MOV [CL], BL

END
