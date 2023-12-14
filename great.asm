.model small

.data

    input_number db 'Enter a number: $'
    greater_than db 'Greater than 5 $'
    less_than db 'Less than 5 $'
    equal_to db 'Equal to 5 $'
    newline db 0ah,0dh, '$'
    number db 0
    
.code

main:

    mov ax, @data
    mov ds, ax
    
    mov ah,09h
    mov dx,offset input_number
    int 21h
    
    mov ah,09h
    mov dx,offset newline
    int 21h
    
    mov ah,01
    int 21h
    
    mov number, al
    
    mov ah,09h
    mov dx,offset newline
    int 21h
    
    mov al, number
    
    cmp al,'5'
    jl LESS
    je EQUAL
    
    
    
GREATER:
    
    mov ah,09h
    mov dx,offset greater_than
    int 21h
    
    mov ah,09h
    mov dx,offset newline
    int 21h
    
    mov ah,4ch
    int 21h

LESS:

    mov ah,09h
    mov dx,offset less_than
    int 21h
  
    mov ah,4ch
    int 21h
    
EQUAL:
    
    mov ah, 09h
    mov dx, offset equal_to
    int 21h
        
end main