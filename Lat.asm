.model small

.data
  output db 'Hello World $'

.code

main:

  mov ax,@data
  mov ds,ax
  
  mov ah,09h
  mov dx,offset output
  int 21h
  
  
  
  mov ah,4ch
  int 21h

end main