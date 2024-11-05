ORG 100h               ; Origin, to specify that the program starts at 100h (COM file format)

                       ; Display the message "Enter the integer: "
MOV AH, 09h            ; Function 09h of INT 21h prints a string
MOV DX, OFFSET msg_input   ; Load the offset of the input message into DX
INT 21h                ; Call DOS interrupt to print the message

                       ; Read a single character from user
MOV AH, 01h            ; Function 01h of INT 21h to read a single character
INT 21h                ; Call DOS interrupt to get the character
MOV BL, AL             ; Store the input character from AL register to BL

                           ; Display the message "The output is: "
MOV AH, 09h                ; Function 09h of INT 21h prints a string
MOV DX, OFFSET msg_output  ; Load the offset of the output message into DX
INT 21h                    ; Call DOS interrupt to print the message

                       ; Print the input character (which is the output)
MOV DL, BL             ; Load the character from BL to DL for output
MOV AH, 02h            ; Function 02h of INT 21h to print a character
INT 21h                ; Call DOS interrupt to print the character

                       ; Terminate the program
MOV AH, 4Ch            ; Function 4Ch of INT 21h terminates the program
INT 21h                ; Call DOS interrupt to exit

                                    ; Data section with messages
msg_input  DB 'Enter a integer: $'  ; Input prompt message
msg_output DB 0Dh, 0Ah, 'The entered integer is: $'  ; Output message with newline (CRLF)
