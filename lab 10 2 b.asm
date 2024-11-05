  org 100h 
mov cx, 26 
mov bl, 'A' 
print_loop: 
mov ah, 02h 
mov dl, bl 
int 21h 
inc bl 
loop print_loop 
mov ah, 4Ch 
int 21h 
