ORG 100h         

MOV DX, OFFSET msg_input1 
MOV AH, 09h       
INT 21h            

MOV AH, 01h       
INT 21h            
SUB AL, '0'       
MOV BL, AL        

MOV DX, OFFSET msg_input2 
MOV AH, 09h        
INT 21h          

MOV AH, 01h        
INT 21h           
SUB AL, '0'        
MOV CL, AL        

SUB BL, CL         

ADD BL, '0'       

MOV DX, OFFSET msg_output  
MOV AH, 09h       
INT 21h            


MOV DL, BL        
MOV AH, 02h       
INT 21h            
MOV DL, 0Dh        
MOV AH, 02h
INT 21h           
MOV DL, 0Ah        
INT 21h            

MOV AH, 4Ch        
INT 21h          

msg_input1  DB 'Enter the first digit: $'
msg_input2  DB 0Dh, 0Ah, 'Enter the second digit: $'
msg_output   DB 0Dh, 0Ah, 'The result of subtraction is: $'
