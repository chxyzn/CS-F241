.model tiny
.data
    text db "CHAYAN"
    text_len db 6
.code
.startup
    ;set mode
    mov ah, 0
    mov al, 03h
    int 10h
    ;set cursor pos
    mov ah, 02h   
    mov dh, 12 
    mov dl, 40
    mov cl, text_len
    shr cl, 1
    sub dl, cl
    mov bh, 0
    int 10h
    ;write char
    lea si, text
    mov al, text_len
    cbw
    mov di, ax
next_char:
    mov ah, 09h
    mov al, [si]
    mov bh, 0
    mov bl, 10001010b
    mov cx, 1
    int 10h
    inc si
    mov ah,02h
    inc dl
    mov bh,0
    int 10h
    dec di
    jnz next_char
    ;blocking
    mov ah, 07h
blocker:
    int 21h
    cmp al, 'a'
    jnz blocker
.exit
end