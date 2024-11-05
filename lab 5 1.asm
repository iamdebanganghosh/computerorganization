org 100h
num1 db 20h
num2 db 02h

start:
    mov al, num1
    mov bl, num2
    xor ah, ah
    div bl
    mov bh, al
    mov bl, ah

    mov ah, bh
    and ah, 0F0h
    shr ah, 4
    call ascii

    mov ah, bh
    and ah, 0Fh
    call ascii

    call newline

    mov ah, bl
    and ah, 0F0h
    shr ah, 4
    call ascii

    mov ah, bl
    and ah, 0Fh
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
    ret
