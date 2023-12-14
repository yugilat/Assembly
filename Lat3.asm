.model small

.data
  
  input db 'Enter 4 characters: $'
  output db 0ah,0dh,'You entered: $'
  
  number db,0
  number2 db,0
  number3 db,0 
  number4 db,0
 
.code

main:

  mov ax,@data
  mov ds,ax
  
  mov ah,09h
  mov dx,offset input
  int 21h
  
  ;input
  mov ah,08h
  int 21h
  
  mov number,al
  mov ah,02h
  mov dl,'*'
  int 21h
  
  mov ah,08h
  int 21h
  
  mov number2,al
  mov ah,02h
  mov dl,'*'
  int 21h
  
  mov ah,08h
  int 21h
  
  mov number3,al
  mov ah,02h
  mov dl,'*'
  int 21h

  mov ah,08h
  int 21h
  
  mov number4,al
  mov ah,02h
  mov dl,'*'
  int 21h
  
  mov ah,09h
  mov dx,offset output
  int 21h
  
  ;output
  mov ah,02h
  mov dl,number
  int 21h
  
  mov ah,02h
  mov dl,number2
  int 21h
  
  mov ah,02h
  mov dl,number3
  int 21h
  
  mov ah,02h
  mov dl,number4
  int 21h
  
  mov ah,4ch
  int 21h
  
end main