ORG 100h 
MOV AH, 09h 
MOV DX, OFFSET msg_output 
INT 21h 
MOV DL, '4' 
MOV AH, 02h 
INT 21h 
MOV DL, '2' 
MOV AH, 02h 
INT 21h 
MOV AH, 4Ch 
INT 21h 
msg_output DB 0Dh, 0Ah, 'The two-digit number is: $' 
