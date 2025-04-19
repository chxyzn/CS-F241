.model tiny
.data
.code
.startup
    ;set display
    mov ah, 0
    mov al, 3
    int 10h
    ;set cursor
    mov ah, 02
    mov dh, 12
    mov dl, 40
    mov bh, 0
    int 10h
    ;write
    mov cx, 13
next:
    push cx
    ;write
    mov ah, 09
    mov al, 'A'
    mov bl, 4
    mov cx, 1
    int 10h
    ;get cursor
    mov ah, 3
    int 10h
    inc dl
    inc dh
    mov ah, 02
    int 10h
    pop cx
    loop next
    ;blocker
    mov ah,07h
blocker:
    int 21h
    cmp al, 'a'
    jnz blocker
.exit
end