.model small
.stack 100h
.data
    msg1 db 'Enter first single-digit number (0-9): $'
    msg2 db 'Enter second single-digit number (0-9): $'
    equal_msg db 'The numbers are equal.$'
    not_equal_msg db 'The numbers are not equal.$'
    num1 db ?
    num2 db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, msg1
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'      
    mov num1, al     

    lea dx, msg2
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'       
    mov num2, al    

    mov al, num1
    cmp al, num2
    je numbers_are_equal

    lea dx, not_equal_msg
    mov ah, 09h
    int 21h
    jmp end_program

numbers_are_equal:
    lea dx, equal_msg
    mov ah, 09h
    int 21h

end_program:
  
    mov ax, 4C00h
    int 21h
main endp
end main
