.model tiny
.data
    msg db "Enter the string to be compared: $"
    dat1 db "hello12345world67890"
    dat1_len dw 20
    success db 0ah,"Matching string found$"
    failure db 0ah,"Matching string is not found$"
    max_len db 5
    len db ?
    string db 5 dup('$')
.code
.startup
    ;print msg
    lea dx, msg
    mov ah, 09h
    int 21h
    ;input str
    lea dx, max_len
    mov ah, 0ah
    int 21h
    ;compare
    lea si, dat1
    mov bx, dat1_len 
    sub bl, len
    mov ax,bx
    inc ax
again:
    lea di, string
    mov cl, len
    mov ch , 0
    cld 
    repe cmpsb
    je found
    dec ax
    cmp ax, 0
    jne again

    lea dx, failure
    mov ah, 09h
    int 21h
    jmp fin
found:
    lea dx, success 
    mov ah, 09h
    int 21h
fin:
.exit
end