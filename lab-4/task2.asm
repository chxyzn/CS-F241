.model tiny
.data
    ask_username db "Enter your username: $"
    ask_password db "Enter your password: $"
    failed db "Failed$"
    max_username db 20
    len_username db ?
    username db 20 dup('$')
    max_password db 20
    len_password db ?
    password db 20 dup('$')
    correct_username db "chayan"
    correct_password db "password"
    count_username dw 6
    count_password dw 8
    greet db "Hello $"

.code
.startup
    ;print username
    lea dx, ask_username
    mov ah, 9
    int 21h
    ;input username
    lea dx, max_username
    mov ah, 0ah
    int 21h
    ;check username
    mov cx, count_username
    lea si, username
    lea di, correct_username
    cld
    repe cmpsb
    jne auth_fail

password_input:
    ;print password
    mov dl, 0ah
    mov ah, 02h
    int 21h
    lea dx, ask_password 
    mov ah, 9
    int 21h
    ;input password
    lea dx, max_password
    mov ah, 0ah
    int 21h
    ;check password
    mov cx, count_password
    lea si, password
    lea di, correct_password
    cld
    repe cmpsb
    jne auth_fail

    mov dl, 0ah
    mov ah, 02h
    int 21h
    lea dx, greet
    mov ah, 9
    int 21h
    lea dx, username
    mov ah, 9
    int 21h
    jmp over 

auth_fail:
    mov dl, 0ah
    mov ah, 02h
    int 21h
    mov dx, offset failed
    mov ah, 9
    int 21h

over:
.exit
end