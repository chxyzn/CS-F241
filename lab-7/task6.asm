.model tiny
.data
    mem_name db "username$"
    mem_pass db "passw"
    name_count dw 8
    pass_count dw 5
    f1 db "user.txt", 0
    f2 db "password.txt", 0
    handle dw ?
    fusername db 8 dup(?)
    fpass db 5 dup(?)
    hello db 0ah, "Hello $"
    denied db 0ah,"Access Denied!$"
.code
.startup
    ;open file
    mov ah, 3dh
    mov al, 0
    lea dx, f1
    int 21h
    mov handle, ax
    ;read file
    mov ah, 3fh
    mov bx, handle
    mov cx, name_count
    lea dx, fusername
    int 21h
    ;compare
    mov cx, ax
    lea si, mem_name
    lea di, fusername
    cld
    repe cmpsb
    jne access_denied
    ;close
    mov ah, 3eh
    mov bx, handle
    int 21h

    ;open pass
    mov ah, 3dh
    mov al, 0
    lea dx, f2
    int 21h
    mov handle, ax
    ;read file
    mov ah, 3fh
    mov bx, handle
    mov cx, pass_count
    lea dx, fpass
    int 21h
    ;compare
    mov cx, ax
    lea si, mem_pass
    lea di, fpass
    cld
    repe cmpsb
    jne access_denied
    jmp greet

access_denied:
    lea dx, denied
    mov ah, 09h
    int 21h
    jmp fin
greet:
    lea dx, hello
    mov ah, 09h
    int 21h
    lea dx, mem_name
    mov ah, 09h
    int 21h
fin:
    mov ah, 3eh
    mov bx, handle
    int 21h
.exit
end