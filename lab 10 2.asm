org 100h 
mov cx, 26 
mov bl, 'Z' 
print_loop: 
mov ah, 02h 
mov dl, bl 
int 21h 
dec bl 
loop print_loop 
mov ah, 4Ch 
int 21h 
