org 100h       ; Set the starting address

; Define two 8-bit numbers
num1 db 25h    ; First number (hexadecimal 25)
num2 db 27h    ; Second number (hexadecimal 17)

start:
    mov al, num1       ; Load num1 into AL
    add al, num2       ; Add num2 to AL
    jc carry           ; If there's a carry, jump to carry handling
    mov bl, al         ; Store the result in BL for display

    ; Display high nibble of the result
    mov ah, bl         ; Move the result from BL to AH
    and ah, 0F0h       ; Mask the lower nibble
    shr ah, 4          ; Shift right by 4 to get the high nibble
    call ascii         ; Convert and print high nibble

    ; Display low nibble of the result
    mov ah, bl         ; Reload the result from BL to AH
    and ah, 0Fh        ; Mask the high nibble, keeping only the low nibble
    call ascii         ; Convert and print low nibble

    jmp end_program    ; Jump to end of the program

carry:
    ; Handle carry (if addition results in a carry beyond 8 bits)
    ; Display an overflow message
    lea dx, overflow_message ; Load address of overflow message into DX
    call print_string
    jmp end_program

end_program:
    mov ah, 4Ch        ; Exit program
    int 21h

ascii:
    add ah, 30h        ; Convert 0-9 to ASCII
    cmp ah, 39h        ; Check if greater than '9'
    jle print          ; If <= '9', jump to print
    add ah, 7          ; Adjust for A-F in hexadecimal
print:
    mov dl, ah         ; Move the character to DL
    mov ah, 02h        ; Prepare for print
    int 21h            ; Print the character
    ret                ; Return from subroutine

print_string:
    mov ah, 09h        ; DOS service to print string
    int 21h
    ret

overflow_message db 'Overflow occurred during addition.$'
