.model tiny
.data
    fname db "out.txt", 0
    hostel db 0ah, "Vyas 1151"
    handle dw ?
.code
.startup
    ;open file
    mov ah, 3dh
    mov al, 1
    lea dx, fname
    int 21h
    mov handle, ax
    ;move pointer
    mov ah, 42h
    mov al, 2
    mov bx, handle
    mov cx, 0
    mov dx, cx
    int 21h
    ;write
    mov ah, 40h
    mov bx, handle
    mov cx, 9
    lea dx, hostel
    int 21h
    ;close
    mov ah, 3eh
    mov bx, handle
    int 21h
.exit
end