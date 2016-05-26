mov al, B		;AL=B

for:
	sub AL,2	;Al-=2
	cmp AL, 0	;AL<0?
	JNS for		;jesli nie to skacze na poczatek petli
	
END