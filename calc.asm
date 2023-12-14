.model small

.data

    menu1 db 'Options:', 13, 10
         db 'Press [1]: 1 digit operation', 13, 10
         db 'Press [2]: 2 digits operation', 13, 10
         db 'Press any key to exit', 13, 10, '$'
    menu2 db 10, 'Enter a number: $' 
    menu3 db 13, 10, 'Choose operation:', 13, 10
         db 'Press [1]: Addition', 13, 10
         db 'Press [2]: Subtraction', 13, 10, '$'
    result db 10, 'The result is: ', '$' 
    exit_message db 13, 10, 'Press any key to exit', 13, 10, '$'

    number1 db 0
    number2 db 0
    sum db 0

.code

main:

    mov ax, @data
    mov ds, ax

main_menu:

    mov ah, 09h
    mov dx, offset menu1
    int 21h

    mov ah, 01
    int 21h

    cmp al, '1'
    je one_digit_operation
    cmp al, '2'
    je two_digit_operation
    jmp exit

main_menu_loop:

    jmp main_menu

one_digit_operation:

    mov ah, 09h
    mov dx, offset menu2
    int 21h

    mov ah, 01
    int 21h
    mov [number1], al

    mov ah, 09h
    mov dx, offset menu2
    int 21h

    mov ah, 01
    int 21h
    mov [number2], al

    mov ah, 09h
    mov dx, offset menu3
    int 21h

    mov ah, 01
    int 21h

    cmp al, '1'
    je addition
    cmp al, '2'
    je subtraction
    jmp main_menu_loop

two_digit_operation:

    mov ah, 09h
    mov dx, offset menu2
    int 21h

    mov ah, 01
    int 21h
    mov [number1], al 

    mov ah, 01
    int 21h
    mov [number1 + 1], al 

    mov ah, 09h
    mov dx, offset menu2
    int 21h

    mov ah, 01
    int 21h
    mov [number2], al 

    mov ah, 01
    int 21h
    mov [number2 + 1], al 

   
    mov ah, 09h
    mov dx, offset menu3
    int 21h

    mov ah, 01
    int 21h

    cmp al, '1'
    je addition_2digits
    cmp al, '2'
    jmp subtraction_2digits
    jmp main_menu_loop

addition:
   
    mov al, [number1]
    add al, [number2]
    sub al, '0'
    mov [sum], al

    mov ah, 09h
    mov dx, offset result
    int 21h

    mov ah, 02h
    mov dl, [sum]
    int 21h

    mov ah, 09h
    mov dx, offset exit_message
    int 21h

    mov ah, 01
    int 21h

    jmp main_menu_loop

subtraction:
   
    mov al, [number1]
    sub al, [number2]
    add al, '0'
    mov [sum], al

    mov ah, 09h
    mov dx, offset result
    int 21h

    mov ah, 02h
    mov dl, [sum]
    int 21h

    mov ah, 09h
    mov dx, offset exit_message
    int 21h

    mov ah, 01
    int 21h

    jmp main_menu_loop

addition_2digits:

    mov al, [number1 + 1]
    sub al, '0'       
    mov bl, [number1]
    sub bl, '0'        

    mov cl, [number2 + 1]
    sub cl, '0'       
    mov dl, [number2]
    sub dl, '0'       

    add al, dl

    add bl, cl

    cmp al, 10
    jl no_tens_carry
    sub al, 10
    inc bl

no_tens_carry:

    add al, '0'
    add bl, '0'
    mov [number1], bl
    mov [number1 + 1], al

    mov ah, 09h
    mov dx, offset result
    int 21h

    mov ah, 02h
    mov dl, [number1 + 1]
    int 21h

    mov dl, [number1]
    int 21h

    mov ah, 09h
    mov dx, offset exit_message
    int 21h

    mov ah, 01
    int 21h

    jmp main_menu_loop

subtraction_2digits:

    mov al, [number1 + 1]
    sub al, '0'        
    mov bl, [number1]
    sub bl, '0'       

    mov cl, [number2 + 1]
    sub cl, '0'       
    mov dl, [number2]
    sub dl, '0'       

    sub al, dl

    jb no_ones_borrow
    add al, 10
    dec bl

no_ones_borrow:
  
    sub bl, cl

    jb no_tens_borrow
    add bl, 10

no_tens_borrow:

    add al, '0'
    add bl, '0'
    mov [sum], al

    mov ah, 09h
    mov dx, offset result
    int 21h

    mov ah, 02h
    mov dl, [sum]
    int 21h

    mov ah, 09h
    mov dx, offset exit_message
    int 21h

    mov ah, 01
    int 21h

    jmp main_menu_loop

exit:

    mov ah, 4ch
    int 21h

end main

