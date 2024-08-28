org 100h              
 
num1 dw 1234h         
num2 dw 5678h         

start:
     mov ax, num1      
     sub ax, num2                 
     mov bx, ax         
     mov ah, bh                       
     and ah, 0F0h      
     shr ah, 4        
     add ah, 30h      
     cmp ah, 39h       
     jle print_first_digit
     add ah, 7         
 print_first_digit:
       mov dl, ah      
       mov ah, 02h    
       int 21h
      mov ah, bh
      and ah, 0Fh     
      add ah, 30h     
      cmp ah, 39h
      jle print_second_digit
      add ah, 7       
print_second_digit:
       mov dl, ah      
       mov ah, 02h   
       int 21h     
     mov ah, bl       
     and ah, 0F0h    
     shr ah, 4       
     add ah, 30h      
     cmp ah, 39h       
     jle print_third_digit
     add ah, 7         
 print_third_digit:
       mov dl, ah     
       mov ah, 02h     
       int 21h
      mov ah, bl
      and ah, 0Fh     
      add ah, 30h      
      cmp ah, 39h
      jle print_fourth_digit
      add ah, 7    
 print_fourth_digit:
       mov dl, ah      
       mov ah, 02h     
       int 21h        
       mov ah, 4Ch     
       int 21h

ret