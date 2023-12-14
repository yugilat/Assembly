.model small

.data
  input db 'Enter a number: $'
  output db 0ah,0dh,'You enter number: $'
  
  ;variable
  number db,0
  
  
.code

main:

  ;no garbage character
  mov ax,@data
  mov ds,ax
  
  ;input
  mov ah,09h
  mov dx,offset input
  int 21h
  
  ;character input
  mov ah,01h
  int 21h
  
  ;output
  mov ah,09h
  mov dx,offset output
  int 21h
  
  mov ah,02h
  mov dl,al
  int 21h
  
  mov ah,4ch
  int 21h

end main