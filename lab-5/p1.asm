.model tiny
.data
    msg db 0ah,"Enter a 5 digit number: $"
    odd db 0ah,"Odd$"
    evenn db 0ah,"Even$"
    negative db "Negative",0ah,24h
    positive db "Positive",0ah,24h
    and_str db " and $"
    continue_msg db "Do you want to continue? (y/n) $"
    failed_msg db "Input less than 5 digit$"
    max_input db 6
.code
.startup
again:
    ;print msg
    lea si, msg
    call printer 
    ;input
    lea dx, max_input
    mov ah,0ah
    int 21h
    ;check size
    mov bx, dx
    mov al,[bx+1]
    mov ah,0
    cmp ax,5
    jb failed
    ;check even/odd
    lea si, max_input
    add si,6
    mov al, [si]
    and al, 00000001b
    cmp al, 0
    jne odd_case
    lea si, evenn
    call printer
    jmp next
    odd_case:
    lea si, odd
    call printer
next:
    ;print and
    lea si, and_str
    call printer
    ;check neg/pos
    lea si, max_input
    add si,2
    mov al,[si]
    and al, 00001000b
    cmp al,0
    je positive_case
    lea si, negative
    call printer
    jmp ask_continue
positive_case:
    lea si, positive
    call printer

ask_continue:
    lea si,continue_msg
    call printer
    ;char input
    mov ah,08h
    int 21h
    cmp al,'y'
    je again
    jne to_end

failed:
    lea si, failed_msg
    call printer
to_end:

.exit
printer proc near uses ax dx si
    mov ah, 09h       
    mov dx, si
    int 21h
    ret
printer endp
end