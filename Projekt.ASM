;Napisz program w asm obliczaj1cy	
; (b^3+a^2)-(((( (8|(2+1))/((a/b)+(2^3)) )*3)*b)*4)+(-22)

;Przyk³adowe dane:
;a=9
;b=1
;b^3=1
;a^2=81
;(b^3+a^2)=82
;(a/b)=9
;((a/b)+(2^3))17
;(56)/((a/b)+(2^3))=3
;((56)/((a/b)+(2^3)))*3=9
;(( (56)/((a/b)+(2^3)) )*3)*b)=9
;((( (56)/((a/b)+(2^3)) )*3)*b)*4)=36
;(b^3+a^2)-(((( (54)/((a/b)+(2^3)) )*3)*b)*4)=46
; (b^3+a^2)-(((( (54)/((a/b)+(2^3)) )*3)*b)*4)+(-22)=24
;wynik=24

JMP START
DB 5
DB 0
DB 08

IRET
DB 0
DB 0

;Wprowadz dane
	IN 08
	CMP AL,0D
	JZ END
	MUL BL,A
	SUB AL,30
	ADD BL,AL
IRET

START:
	MOV AL,00
	OUT 01
	STI
	OUT 08	
JMP START

;zapisz dane
END:
	CLI
	INC CL
	CMP CL,1
	JNZ SKIP
		MOV [06],BL
		MOV BL,0
		JMP START
	SKIP:
	MOV [07],BL

; b^3
MOV AL, [7] ; b
MOV BL, [7] ; b
MUL AL, BL
MUL AL, BL
JO OVERFLOW

; a^2
MOV BL, [6] ; a
MUL BL, BL
JO OVERFLOW

; b^3+a^2
ADD AL, BL
JO OVERFLOW

; a/b
MOV BL, [6]
MOV CL, [7]
DIV BL, CL

; 2^3
MOV CL, 2
MOV DL, 2
MUL CL, CL
MUL CL, DL

; (a/b)+(2^3)
ADD BL, CL
JO OVERFLOW

; 56
CALL 8B ;wynik do CL

; (56)/((a/b)+(2^3))
DIV CL, BL

; ((56)/((a/b)+(2^3)))*3
MUL CL, 3
JO OVERFLOW

; (((56)/((a/b)+(2^3)))*3)*b
MOV DL, [7]
MUL CL, DL
JO OVERFLOW

; ((((56)/((a/b)+(2^3)))*3)*b)*4
MUL CL, 4
JO OVERFLOW

; (b^3+a^2)-(((((56)/((a/b)+(2^3)))*3)*b)*4)
SUB AL, CL

; (b^3+a^2)-(((((56)/((a/b)+(2^3)))*3)*b)*4)+(-22)
ADD AL, EA
JO OVERFLOW
HALT

;8 po (2+1)
org 8B
	PUSH BL
	MOV BL,8
	MOV CL,1
	MOV DL,1
	FOR:
		SUB BL,DL
		INC BL
		DIV CL,DL
		MUL CL,BL
		JO OVERFLOW
		MOV BL,8
		INC DL  
		CMP DL,3
		JS FOR
		JZ FOR
	POP BL
RET

OVERFLOW:
	MOV AL,90
	OUT 01

END

; n = 8;
; k = 3;
; 
; r = 1;
; 
; for(var i = 1; i <=k; i++){
; 	r *= (n - i) + 1;
; 	r /=i;
; }
; return r;
; 
; r = 1;
; 
; for(var i = 1; i <= 2; i++){
; 	r *= 10 - i;
; 	r /=i;
; }
; return r;