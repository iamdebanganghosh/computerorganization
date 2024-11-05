org 100h
num1 dw 1234h   
num2 dw 5678h   
start:
    
    mov ax, num1 
    add ax, num2  
  
    mov bl, ah    
    mov al, al   

    mov ah, bl    
    and ah, 0F0h  
    shr ah, 4     
    add ah, 30h  
    cmp ah, 39h   
    jle print_high_digit
    add ah, 7    

print_high_digit:
    mov dl, ah    
    mov ah, 02h   
    int 21h    

    mov ah, bl    
    and ah, 0Fh   
    add ah, 30h   
    cmp ah, 39h   
    jle print_low_digit
    add ah, 7     

print_low_digit:
    mov dl, ah   
    mov ah, 02h   
    int 21h       

    
    mov ah, 4Ch   
    int 21h