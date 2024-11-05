org 100h
mov cx, 10 
mov bl, '9' 
print_loop: 
mov ah, 02h 
mov dl, bl 
int 21h 
dec bl 
loop print_loop 
mov ah, 4Ch 
int 21h 
