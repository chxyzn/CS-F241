.model tiny
.data
    fname db "out.txt", 0
    handle dw ?
    max_len db 30
    len db ?
    string db 31 dup('$')
    new_name db "oout.txt", 0
.code
.startup
    ;create file
    mov ah, 3ch
    lea dx, fname
    mov cl, 0
    int 21h
    mov handle, ax
    ;input string
    lea dx, max_len
    mov ah, 0ah
    int 21h
    ;write input
    mov ah, 40h
    mov bx, handle
    mov cl, len
    mov ch, 0
    lea dx, string
    int 21h
    
    ;set date & time
    mov ah, 57h
    mov al, 01h
    mov bx, handle
    mov cx, 4a25h
    mov dx, 524fh
    int 21h
    ;close
    mov ah, 3eh
    mov bx, handle
    int 21h
    ;rename
    ; lea dx, fname
    ; lea di, new_name
    ; mov cl, 0
    ; mov ah, 56h
    ; int 21h
    ;delete
    ; mov ah, 41h
    ; lea dx, new_name
    ; int 21h   
.exit
end