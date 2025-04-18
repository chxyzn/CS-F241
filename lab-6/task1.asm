.model tiny
.data
    fname db "out.txt",0
    uname db "Chayan "
    id db "2022B4A70874P"
    new_line db 0ah
    fhandle dw ?
.code
.startup
    ;create file
    mov ah, 3ch
    lea dx, fname
    mov cl, 0
    int 21h
    mov fhandle, ax
    ;write
    lea dx, uname
    mov cx, 7
    call writer

    lea dx, id
    mov cx, 13
    call writer

    lea dx, new_line
    mov cx, 1
    call writer

    lea dx, uname
    mov cx, 7
    call writer

    lea dx, id
    mov cx, 13
    call writer

    ;close
    mov ah, 3eh
    mov bx, fhandle
    int 21h
.exit
writer proc near uses ax bx
    mov bx, fhandle
    mov ah, 40h
    int 21h
    ret
writer endp
end