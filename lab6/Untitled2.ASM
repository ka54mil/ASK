MOV AL, 0; AL=0
SUB AL, B; Al-=11
MOV BL,0 ; Bl=0

loop:

ADD BL,AL; BL+=AL
INC AL	;AL++

CMP AL, 6; AL<5
JNZ loop

END