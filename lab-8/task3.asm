.model tiny
.data
    proc_arg_attr db ?
    char db ?
.code
.startup
    mov ah, 0
    mov al, 03h
    int 10h
    ;set cursor start pos
    mov ah, 02
    mov dh, 0
    mov dl, 0
    mov bh, 0
    int 10h
    mov proc_arg_attr, 1eh
    call fill_background

    ;set cursor pos
    mov ah, 02
    mov dh, 0
    mov dl, 40
    mov bh, 0
    int 10h
    mov proc_arg_attr, 7ah
    call fill_background

    ;set cursor pos
    mov ah,02h
    mov dh, 0
    mov dl, 0
    mov bh, 0
    int 10h

    ;blocker
blocker:
    mov ah, 07h
    int 21h
    mov char, al
    cmp al, '$'
    jne not_dollar
    mov ah, 07h
    int 21h
    cmp al, '#'
    jne only_dollar
    jmp fin
only_dollar:
not_dollar:
    ;write char
    mov ah, 09
    mov bl, 1eh
    mov cx, 1
    int 10h
    ;get pos
    mov ah, 03h
    int 10h
    ;set to other half
    mov ah,02h
    add dl, 40
    int 10h
    ;write
    mov ah,09
    mov al, char
    mov bl,7ah
    mov cx, 1
    int 10h
    ;set cursor back
    mov ah,02h
    sub dl,40
    inc dl
    cmp dl, 40
    jne call_int
    inc dh
    mov dl, 0
    cmp dh, 25
    jne call_int
    mov dh, 0
call_int:
    int 10h

    mov al, char
    cmp al, '_'
    jnz blocker 
fin:
.exit
fill_background proc near uses ax bx cx dx
    mov cx, 25
next_col:
    push cx
    ;write
    mov ah, 09
    mov al, ' '
    mov bh, 0
    mov bl, proc_arg_attr
    mov cx, 40 
    int 10h
    ;get cursor pos
    mov ah, 03h
    int 10h
    inc dh
    ;set cursor pos
    mov ah, 02h
    int 10h
    pop cx
    loop next_col
    ret
fill_background endp
end