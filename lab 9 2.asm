.model small
.stack 100h
.data
    msg db 'Enter a single-digit number (0-9): $'
    even_msg db 'The number is even.$'
    odd_msg db 'The number is odd.$'
    num db ?

.code
main proc
    
    mov ax, @data
    mov ds, ax

    lea dx, msg
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h

    cmp al, '0'
   
    cmp al, '9'

    sub al, '0'
    mov num, al          

   
    mov al, num
    and al, 1            
    jz is_even            

    lea dx, odd_msg
    mov ah, 09h
    int 21h
    jmp end_program

is_even:
    lea dx, even_msg
    mov ah, 09h
    int 21h

end_program:
  
    mov ax, 4C00h
    int 21h
main endp
end main

