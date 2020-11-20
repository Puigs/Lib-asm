BITS 64
SECTION .text

GLOBAL strpbrk

strpbrk:
    push rbp,
    mov rbp, rsp
    mov rax, 0
    cmp rdi, 0
    je strpbrk_end
    cmp rsi, 0
    je strpbrk_end
    mov r8, rsi
strpbrk_start:
    cmp [rdi], byte 0
    je strpbrk_end
    cmp [r8], byte 0
    je str_move
    mov r10b, byte [r8]
    cmp byte [rdi], r10b
    je strpbrk_equal
    inc r8
    jmp strpbrk_start

str_move:
    mov r8, rsi
    inc rdi
    jmp strpbrk_start

strpbrk_equal:
    mov rax, rdi
    jmp strpbrk_end

strpbrk_end:
    leave
    ret