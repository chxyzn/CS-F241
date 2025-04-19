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
    mov dl, 0
    mov bh, 0
    int 10h
    ;write 
    mov ah, 09
    mov al, 'C'
    mov bl, 10
    mov cx, 80 
    int 10h

    ;set cursor
    mov ah, 02
    mov dl, 40
    mov dh, 0
    int 10h
    mov cx, 25
next:
    push cx 
    ;write
    mov ah, 09
    mov al, 'C'
    mov bl, 10
    mov cx, 1 
    int 10h
    ;update cursor
    mov ah, 02
    inc dh
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