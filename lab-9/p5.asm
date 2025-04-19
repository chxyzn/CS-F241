.model tiny
.data
.code
.startup
    ;set display
    mov ah, 0
    mov al, 3
    int 10h
    ;set cursor horizontal top
    mov ah, 02
    mov dh, 0
    mov dl, 0
    mov bh, 0
    int 10h
    ;write 
    mov ah, 09
    mov al, 'A'
    mov bl, 6
    mov cx, 80 
    int 10h
    ;set cursror horizontal bottom 
    mov dh, 24
    mov ah, 02
    int 10h
    ;write 
    mov ah, 09
    mov al, 'A'
    mov bl, 6
    mov cx, 80 
    int 10h
    ;set cursor vertical left
    mov ah, 02
    mov dl, 0
    mov dh, 0
    int 10h
    mov cx, 25
next:
    push cx 
    ;write
    mov ah, 09
    mov al, 'A'
    mov bl, 6
    mov cx, 1 
    int 10h
    ;set cursor vertical right
    mov ah, 02
    add dl, 79
    int 10h
    ;write
    mov ah, 09
    mov al, 'A'
    mov bl, 6
    mov cx, 1 
    int 10h
    ;set cursor back
    mov ah, 02
    sub dl, 79
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