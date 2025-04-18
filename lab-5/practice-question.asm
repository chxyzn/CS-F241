.model tiny
.data
    display_message db "Enter a string of max 20 char: $"
    max_input db 20
    len db ?
    string db 20 dup('$')
    encrypted db 20 dup('$')
    shifter db 2
.code
.startup
    ;print display message
    lea dx, display_message
    mov ah , 9h
    int 21h
    ;input string
    lea dx, max_input
    mov ah, 0ah
    int 21h
    ;reverse string
    mov cl, len
    mov ch, 0
    lea si, len 
    mov al, len
    mov ah, 0
    add si, ax
    lea di, encrypted
reverse:
    std
    lodsb
    cld
    stosb
    loop reverse
    ;encrypt
    lea si,encrypted
    mov cl, len
    mov ch, 0
encrypt:
    not byte ptr [si]
    push cx
    mov cl, shifter
    ror byte ptr[si],cl
    pop cx
    inc si
    loop encrypt
    ;print encrypted 
    mov dl, 0ah
    mov ah, 2h
    int 21h
    lea dx, encrypted
    mov ah, 9h
    int 21h
.exit
end