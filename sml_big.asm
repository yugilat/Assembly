.model small

.data

    prompt_msg db 'Enter a character: $'
    newline db 0ah, 0dh, '$'
    result_msg db 'Big character: $'
    invalid_msg db 'NOT A LETTER! $'
    character db 0

.code

main:

    mov ax,@data
    mov ds,ax

    mov ah,09h
    mov dx,offset prompt_msg
    int 21h

    mov ah,01h
    int 21h
    mov character,al

    mov ah,09h
    mov dx,offset newline
    int 21h

    cmp al,'a'
    jl NOT_A_LETTER
    cmp al,'z'
    jle SMALL_LETTER

    cmp al,'A'
    jl NOT_A_LETTER
    cmp al,'Z'
    jle BIG_LETTER

NOT_A_LETTER:

    mov ah,09h
    mov dx,offset invalid_msg
    int 21h
    jmp END_PROGRAM

SMALL_LETTER:

    sub al,20h
    jmp DISPLAY_RESULT

BIG_LETTER:

    add al,20h

DISPLAY_RESULT:

    mov ah,09h
    mov dx,offset result_msg
    int 21h

    mov ah,02h
    mov dl,al
    int 21h

    mov ah,09h
    mov dx,offset newline
    int 21h

END_PROGRAM:

    mov ah,4ch
    int 21h

end main