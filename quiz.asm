.model small

.data

    binary_input db 4 dup(0)  
    decimal_result db 0        
    newline db 10,13, '$'   
    prompt_message db 'Enter binary number: $'
    result_message db 'Decimal: $'


.code

main:

    mov ax,@data
    mov ds,ax
    
    mov ah,09h
    lea dx,prompt_message
    int 21h
    
    lea di,binary_input  
    mov cx,4            
    
input_loop:

    mov ah,01h           
    int 21h              
    
   
    cmp al,'0'
    je is_zero
    cmp al,'1'
    je is_one
    jmp invalid_input

is_zero:

    mov [di],0         
    jmp input_done

is_one:

    mov [di],1         
    jmp input_done

invalid_input:
    

input_done:

    inc di
    loop input_loop
    
  
    xor ax,ax
    mov cl,4           
    lea di, binary_input  
    
binary_to_decimal_loop:

    shl ax,1            
    add al,[di]         
    inc di
    loop binary_to_decimal_loop
    
    mov ah,09h
    lea dx, newline
    int 21h
    
;Display_decimal

    mov ah,09h
    lea dx,result_message
    int 21h

    mov ah,02h
    mov dl,al
    add dl,30h
    int 21h

    mov ah,4ch
    int 21h

end main