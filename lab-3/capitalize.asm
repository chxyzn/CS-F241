.model tiny
.data
    DATA db "MicroProcessoR"
    count db 14
.code
.startup
    lea si, DATA
    mov cl, count
search:
    mov al, [si]
    cmp al, 'A'
    jl next
    cmp al, 'Z'
    jg next
    add al, 20h
    mov [si], al
next:
    inc si
    dec cx
    jnz search

.exit
end