;Napisz program w asm obliczaj¹cy	
; (b^3+a^2)-(((((56)/((a/b)+(2^3)))*3)*b)*4)+(-22)
JMP start


start:
IN 00
SUB AL, 30
MOV [00], AL ; read 
IN 00
SUB AL, 30
MOV [01], AL ; read b
JNO skip_1
	;INT 
skip_1:

; b^3
MOV AL, [1] ; b
MOV BL, [1] ; b
MUL AL, BL
MUL AL, BL
JNO skip_2
	;INT 
skip_2:

; a^2
MOV BL, [0] ; a
MUL BL, BL
JNO skip_3
	;INT 
skip_3:

; b^3+a^2
ADD AL, BL
JNO skip_4
	;INT 
skip_4:

; a/b
MOV BL, [00]
MOV CL, [00]
DIV BL, CL

; 2^3
MOV CL, 2
MOV DL, 2
MUL CL, CL
MUL CL, DL

; (a/b)+(2^3)
ADD BL, CL
JNO skip_5
	;INT 
skip_5:

; 56
MOV CL, 56 ; TODO: MAke call to procedure

; (56)/((a/b)+(2^3))
DIV CL, BL

; ((56)/((a/b)+(2^3)))*3
MUL CL, 3
JNO skip_6
	;INT 
skip_6:

; (((56)/((a/b)+(2^3)))*3)*b
MOV DL, [1]
MUL CL, DL
JNO skip_7
	;INT 
skip_7:

; ((((56)/((a/b)+(2^3)))*3)*b)*4
MUL CL, 4
JNO skip_8
	;INT 
skip_8:

; (b^3+a^2)-(((((56)/((a/b)+(2^3)))*3)*b)*4)
SUB AL, CL

; (b^3+a^2)-(((((56)/((a/b)+(2^3)))*3)*b)*4)+(-22)
ADD AL, EA
JNO skip_9
	;INT 
skip_9:

END
; n = 9;
; k = 2;
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