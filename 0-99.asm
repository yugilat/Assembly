.model small

.data

    message db 'Hello World$'
    count dw 60000
    
.code
   
main:

    mov ax,@data
    mov ds,ax
    
    mov cx,100
    mov bl,'0'
    mov bh,'0'
    
count_loop:

    call display_number
    call delay
    
    inc bl
    
    cmp bl,'9'
    jg tenths
    
    loop count_loop
    
tenths:
    
    inc bh
    mov bl, '0'
    
    cmp bh,'9'
    jg EXIT
    
    jmp count_loop
    
EXIT: 

    mov ah,4ch
    int 21h
    
display_number:
    
    mov ah,02h
    mov dl,bh
    int 21h
    
    mov dl,bl
    int 21h
    
    mov dl,' '
    int 21h
    
    ret

delay:
    
    mov cx,count
    
delay_loop:

    dec cx
    jnz delay_loop
    
    ret

end main