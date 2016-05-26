mov al,40

cmp al, 47
jns end

while:
	inc al
	cmp al,47
	js while
end:
END