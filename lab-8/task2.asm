.model tiny
.data
.code
.startup
    ;set mode
    mov ah, 0
    mov al, 12h
    int 10h
    ;set top left corner
    mov bx, 0
draw_top_horizontal:
    mov ah, 0ch
    mov al, 1100b
    mov dx, 80
    mov cx, 70
    add cx, bx
    int 10h
    add dx,80 
    int 10h
    inc bx
    cmp bx, 100
    jbe draw_top_horizontal
    mov bx,0
draw_right_vertical:
    mov ah,0ch
    mov al, 1100b
    mov dx, 80
    mov cx, 170
    add dx, bx
    int 10h
    sub cx, 100
    int 10h
    inc bx
    cmp bx, 80
    jbe draw_right_vertical
    ;blocker
    mov ah,07h
blocker:
    int 21h
    cmp al, 'a'
    jnz blocker

.exit
end