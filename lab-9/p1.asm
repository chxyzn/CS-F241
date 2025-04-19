.model tiny
.data
    char_to_print db ?
    attr db 1h
.code
.startup
    ;set display
    mov ah, 0
    mov al, 3
    int 10h
    ;print
    ;set top left
    mov ah, 02
    mov dh, 0
    mov dl, 0
    mov bh, 0
    int 10h
    mov char_to_print,'1' 
    call grid_printer

    ;set top right
    mov dl, 77
    int 10h
    mov char_to_print, '2'
    call grid_printer

    ;set bottom right 
    mov dh, 22
    int 10h
    mov char_to_print, '4'
    call grid_printer

    ;set bottom left
    mov dl, 0
    int 10h
    mov char_to_print, '3'
    call grid_printer

    ;set center
    mov dh, 11
    mov dl, 39
    int 10h
    mov char_to_print, '5'
    call grid_printer

    ;blocker
    mov ah,07h
blocker:
    int 21h
    cmp al, 'a'
    jnz blocker
.exit
grid_printer proc near uses ax bx cx dx
    mov cx, 3
next_col:
    push cx
    ;write
    mov ah, 09
    mov al, char_to_print
    mov bh, 0
    mov bl, attr
    mov cx, 3
    int 10h
    ;set  cursor
    mov ah, 02
    inc dh
    int 10h
    pop cx
    loop next_col
    ret
grid_printer endp
end