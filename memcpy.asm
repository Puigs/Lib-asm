BITS 64
SECTION .text

GLOBAL memcpy

memcpy:
    push rbp
    mov rbp, rsp
    cmp rdi, 0
    je memcpy_end
    cmp rsi, 0
    je memcpy_end
    cmp dx, 0
    je memcpy_end
    jmp memcpy_start

memcpy_start:
    cmp rdx, 0
    je memcpy_end
    sub rdx, 1
    mov r10b, byte [rsi + rdx]
    mov byte [rdi + rdx], r10b
    jmp memcpy_start

memcpy_end:
    mov rax, rdi
    leave
    ret

