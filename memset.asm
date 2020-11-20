BITS 64
SECTION .text

GLOBAL memset

memset:
    push rbp
    mov rbp, rsp
    cmp rdi, 0
    je memset_end
    cmp rdx, 0
    je memset_end
    cmp sil, 0
    je memset_end
    jmp memset_start
memset_start:
    cmp rdx, 0
    je memset_end
    sub rdx, 1
    mov byte [rdi + rdx], sil 
    jmp memset_start

memset_end:
    mov rax, rdi
    leave
    ret