.model tiny
.data
    fname db "out.txt", 0
    handle dw ?
    read_data db ?
.code
.startup
    ;open file
    mov ah, 3dh
    mov al, 0
    lea dx, fname
    int 21h
    mov handle, ax
    ;read char
    lea dx, read_data
read_char:
    mov ah, 3fh
    mov bx, handle
    mov cx, 1
    int 21h
    inc dx
    cmp ax, 0
    jne read_char
    ;write to screen
    mov bx, dx
    dec bx
    mov byte ptr[bx], '$'
    lea dx, read_data
    mov ah, 09h
    int 21h
    ;close
    mov ah, 3eh
    mov bx, handle
    int 21h
.exit
end