.model tiny
.data
    max db 20
.code
.startup
    lea dx, max
    mov ah, 0ah
    int 21h

    ; to insert $ at the end of the string
    mov bx,dx
    mov si, [bx+1]
    and si, 0fh
    mov ax, 24h
    mov [bx + si + 2], ax

    add dx,2
    mov ah , 9
    int 21h
.exit
end
