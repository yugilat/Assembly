.model small

.data
  msg db 0ah,0dh,'Enter a number: $'
  msg2 db 0ah,0dh,'The sum is: $'
  number1 db 0
  number2 db 0

.code

main:

  mov ax,@data
  mov ds,ax
  
  mov ah,09h
  mov dx,offset msg
  int 21h
  
  mov ah,01h
  int 21h
  
  mov number1,al
  
  mov ah,09h
  mov dx,offset msg
  int 21h
  
  mov ah,01h
  int 21h
  
  mov number2,al
  
  mov al,number1
  mov al,number2
  
  
  mov ah,4ch
  int 21h

end main