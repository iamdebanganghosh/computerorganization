org 100h
s db 20h
h db 30h
mov al,s
mov bl,h
mul bl
     mov bx, ax
     mov ah, bh
     and ah, 0F0h
     shr ah, 4
     add ah, 30h
     cmp ah, 39h
     jle first
     add ah, 7 
first:
       mov dl, ah
       mov ah, 02h
       int 21h
      mov ah, bh
      and ah, 0Fh
      add ah, 30h
      cmp ah, 39h
      jle second
      add ah, 7
      
second:
       mov dl, ah
       mov ah, 02h
       int 21h         
     mov ah, bl
     and ah, 0F0h
     shr ah, 4
     add ah, 30h
     cmp ah, 39h
     jle third
     add ah, 7
     
third:
       mov dl, ah
       mov ah, 02h
       int 21h
      mov ah, bl
      and ah, 0Fh
      add ah, 30h
      cmp ah, 39h
      jle four
      add ah, 7
      
four:
       mov dl, ah
       mov ah, 02h
       int 21h         
       mov ah, 4Ch
       int 21h

ret