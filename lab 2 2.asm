org 100h            ; Set the starting address for .COM programs

; Define two 16-bit numbers (little endian format)
num1 dw 1234h       ; First 16-bit number (0x1234)
num2 dw 0ABCh       ; Second 16-bit number (0x0ABC)

start:
    mov ax, num1        ; Load num1 into AX
    add ax, num2        ; Add num2 to AX
    jc carry            ; If there's a carry, jump to handle carry

    ; Store the result in BX for display
    mov bx, ax

    ; Display high byte of the result
    mov ah, bh          ; Move high byte of BX to AH
    call print_hex      ; Call subroutine to print byte in hex

    ; Display low byte of the result
    mov ah, bl          ; Move low byte of BX to AH
    call print_hex      ; Call subroutine to print byte in hex

    jmp end_program     ; Jump to end of the program

carry:
    ; Handle carry (if addition results in a carry beyond 16 bits)
    lea dx, overflow_message
    call print_string   ; Print overflow message
    jmp end_program     ; Jump to end of the program

end_program:
    mov ah, 4Ch         ; DOS interrupt to exit program
    int 21h

; Subroutine to print a byte in hexadecimal format
print_hex:
    ; Convert and print high nibble
    and ah, 0F0h        ; Mask the lower nibble
    shr ah, 4           ; Shift right by 4 to get the high nibble
    call ascii          ; Convert to ASCII and print

    ; Convert and print low nibble
    mov ah, bl          ; Reload the original byte to AH
    and ah, 0Fh         ; Mask the high nibble
    call ascii          ; Convert to ASCII and print
    ret

; Subroutine to convert a nibble to ASCII and print
ascii:
    add ah, 30h         ; Convert 0-9 to ASCII
    cmp ah, 39h         ; Check if greater than '9'
    jle print_char      ; If <= '9', jump to print_char
    add ah, 7           ; Adjust for 'A'-'F' range
print_char:
    mov dl, ah          ; Move the character to DL
    mov ah, 02h         ; DOS function to print character
    int 21h             ; Call DOS interrupt
    ret

; Subroutine to print a string using DOS function
print_string:
    mov ah, 09h         ; DOS service to print string
    int 21h
    ret

; Define overflow message to display in case of carry
overflow_message db 'Overflow occurred during addition.$'
