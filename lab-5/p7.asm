.model tiny
.data
    msg db 0ah,"Enter the number of characters: $"
    word_msg db 0ah,"Enter the word: $"
    success db 0ah,"Palindrome$"
    failure db 0ah,"Not palindrome$"
    continue_msg db 0ah, "Do you want to continue? (y/n) $"
    end_msg db 0ah, "Exiting...$"
    incorrect_input db 0ah, "Incorrect input $"
    max_len db ?
    len db ?
    string db 5 dup('$')
.code
.startup
again:
    ;display msg
    lea si, msg
    call printer
    ;input num
    mov ah, 1
    int 21h
    cmp al, '4'
    mov max_len,5
    je enter_word
    cmp al, '6'
    mov max_len,7
    je enter_word
    jne fin
enter_word:
    ;display word input
    lea si, word_msg
    call printer
    ;input word
    lea dx, max_len
    mov ah, 0ah
    int 21h
    ;check word length
    mov al, len
    inc al
    cmp al, max_len
    jne incorrect
    ;check palindrome
    lea si, string
    lea di, len
    mov al, len
    cbw
    add di, ax
palindrome:
    mov al, [si]
    cmp al,[di]
    jne faill
    inc si
    dec di
    cmp di, si
    jb succ
    jmp palindrome

succ:
    lea si,success
    call printer
    jmp ask_continue 
faill:
    lea si, failure
    call printer

ask_continue:
    lea si, continue_msg
    call printer
    mov ah,1
    int 21h
    cmp al,'y'
    je again
    jne fin

incorrect:
    lea si, incorrect_input
    call printer

fin:
    lea si, end_msg
    call printer
.exit
printer proc near uses ax dx si
    mov ah, 9 
    mov dx, si
    int 21h
    ret
printer endp
end