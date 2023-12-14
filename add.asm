.model small

.data

    message db 'Enter a number: $'
    output db 'The sum is: $'
    newline db 0ah, 0dh, '$'
    number1 db 0
    number2 db 0
    
.code

main: 
    
    mov ax,@data
    mov ds, dx
    
    mov ah,09h
    mov dx, offset message
    int 21h
    
    mov ah,01
    int 21h
    
    mov number1,al
    
    mov ah,09h
    mov dx,offset newline
    int 21h
    
    mov ah,09h
    mov dx,offset message
    int 21h
    
    mov ah,01
    int 21h
    
    mov number2,al
    
    mov al,number1
    
    ADD al,number2
    SUB al, '0'
    
    mov ah,09h
    mov dx,offset newline
    int 21h
    
    mov ah,02h
    mov dl,al
    int 21h
    
EXIT: 
    
    mov ah,4ch
    int 21h
    
    
end main