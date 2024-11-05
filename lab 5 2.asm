org 100h
num1 dw 5678h
num2 dw 1234h    
start:  
mov ax, num1
mov bx, num2 
div bx
mov bx, ax
mov cx, dx           

mov ah, bh
and ah, 0F0h
shr ah, 4
call ascii

mov ah, bh
and ah, 0Fh
call ascii

mov ah, bl
and ah, 0F0h
shr ah, 4
call ascii

mov ah, bl
and ah, 0Fh
call ascii  
         
call newline         

mov ah, ch
and ah, 0F0h
shr ah, 4
call ascii

mov ah, ch
and ah, 0Fh
call ascii

mov ah, cl
and ah, 0F0h
shr ah, 4
call ascii

mov ah, cl
and ah,0Fh
call ascii 

mov ah, 4Ch
int 21h


ascii:
add ah, 30h
cmp ah, 39h
jle print
add ah, 7

print:
mov dl, ah
mov ah, 02h
int 21h  

ret

newline:
mov dl, 0Dh
mov ah, 02h
int 21h

mov dl, 0Ah
mov ah, 02h
int 21h 
Ret
