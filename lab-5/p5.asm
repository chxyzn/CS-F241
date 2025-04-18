;solving just for one digit hex numbers
.model tiny
.data
    msg db "Enter 10 hexadecimal (1 digit) numbers: $"
    even1 db 11 dup('$')
    odd1 db 11 dup('$')
    even_num db 0ah,"The entered even numbers are: $"
    odd_num db 0ah,"The entered odd numbers are: $"
.code
.startup
    ;print msg
    lea dx, msg
    mov ah, 09h
    int 21h
    ;input chars
    mov cx, 10
    lea si, even1
    lea di, odd1
    ;process char
char:
    mov ah, 08h
    int 21h
    mov ah, al
    and al, 00000001b
    cmp al, 0
    jne odd_
    mov [si],ah
    inc si
    jmp next
odd_:
    mov [di],ah
    inc di
next:
    loop char

    ;print output
    mov ah, 09h
    lea dx, even_num
    int 21h
    lea dx, even1
    int 21h
    lea dx, odd_num
    int 21h
    lea dx, odd1
    int 21h
.exit
end