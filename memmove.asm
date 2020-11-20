BITS 64
SECTION .text

GLOBAL memmove

memmove:
    push rbp
    mov rbp, rsp
    cmp rdi, 0
    je memmove_end
    cmp rsi, 0
    je memmove_end
    cmp dx, 0
    je memmove_end
    jmp memmove_start

memmove_start:
    cmp rdx, 0
    je memmove_end
    sub rdx, 1
    mov r10b, byte [rsi + rdx]
    mov byte [rdi + rdx], r10b
    jmp memmove_start

memmove_end:
    mov rax, rdi
    leave
    ret

