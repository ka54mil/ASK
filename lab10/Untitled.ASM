for:
MOV al, 80
out 01
mov al, c0
out 01
mov al, 20
out 01
mov al, 40
out 01
cmp al, 5
jnz for
end