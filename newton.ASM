JMP start
; function WspNewtona( n, k : integer ) : integer;
; var
;     wynik : integer;
;     i : integer;
; begin
;     wynik := 1;
; 
;     for i := 1 to k do
;         wynik := wynik * (n - i + 1) 
;         wynik := wynik / i;
; 
;     WspNewtona := wynik;
; end;

; function newton(n, k){
;     let r = 1;
;     for(let i = 1; i <= k; i++){
;         r = r * (n - i + 1)
;         r = r / i;
;     }
;     return r;
; };
; newton(7, 2);


; Pamiec 
ORG 4
db 0 ; 4 - n 
db 0 ; 5 - k
db 0 ; 6 - i 
db 0 ; 7 - wynik

ORG 8
MOV [4], AL         ; save n 
MOV [5], BL         ; save k

PUSH BL
PUSH CL
PUSH DL

MOV DL, 1 
MOV [7], DL         ; wynik = 1 
MOV AL, 1 
MOV [6], AL         ; i = 1 
loop:
MOV AL, [6]         ; load i
MOV BL, [5]         ; load k
INC BL
CMP AL, BL
JZ end_loop         ; k > i
    MOV AL, [4]     ; n
    MOV BL, [6]     ; i
    SUB AL, BL      ; n - i
    INC AL          ; (n - 1) + 1
    MOV DL, [7]     ; load wynik
    MUL DL, AL      ; wynik *= n - 1 + 1
    MOV BL, [6]     ; i
    DIV DL, BL      ; wynik /= i
    MOV [7], DL     ; save wynik
    MOV AL,[6]      ; i
    INC AL          ; i++
    MOV [6], AL     ; save i
    JMP loop

end_loop:
MOV AL, [7]
POP BL
POP CL
POP DL
RET

start: 
MOV AL, 7           ; n
MOV BL, 2           ; k
CALL 8
PUSH AL

MOV AL, 7           ; n
MOV BL, 3           ; k
CALL 8
PUSH AL

END