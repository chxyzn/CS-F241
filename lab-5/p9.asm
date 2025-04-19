.model tiny
.data
    msg db "Enter maximum 10 characters: $"
    final_msg db 0ah,"Capital chars are : $"
    max_len db 11
    len db ?
    string db 12 dup('$')
    out_string db 11 dup('$')
.code
.startup
    ;out msg
    mov ah, 09h
    lea dx, msg
    int 21h
    ;in input
    mov ah, 0ah
    lea dx, max_len
    int 21h
    ;process
    add dx, 2
    mov si, dx
    lea di, out_string
scan:
    cld
    lodsb
    cmp al, '$'
    je print_out
    cmp al, 'A'
    jb  scan
    cmp al, 'Z'
    ja scan
    stosb
    jmp scan

print_out:
    mov ah, 09h
    lea dx, final_msg
    int 21h
    ;print output
    lea dx, out_string
    int 21h

.exit
end
