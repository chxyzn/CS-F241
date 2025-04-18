.model tiny
.data
    DATA1 db 11,12,13,00,0a0h,00,3f,4c,0cch,00
    count db 10
.code
.startup
    mov cl, count
    lea si, DATA1
search:
    mov al, [si]
    cmp al,00
    jne next
    mov al, 0ffh
    mov [si], al
next:
    inc si
    loop search
.exit
end