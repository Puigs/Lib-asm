BITS 64
SECTION .text

GLOBAL strncmp

strncmp:
    push rbp
    mov rbp, rsp
    mov eax, 0
    mov r10b, 0
    mov r11b, 0
    cmp rdi, 0
    je strncmp_end
    cmp rsi, 0
    je strncmp_end
    cmp rdx, 0
    je strncmp_end

strncmp_start:
    cmp [rdi], byte 0
    je strncmp_end
    cmp [rsi], byte 0
    je strncmp_end
    cmp rdx, 0
    je strncmp_end
    mov r10b, byte [rdi]
    mov r11b, byte [rsi]
    cmp r10b, r11b
    jne strncmp_end
    inc rdi
    inc rsi
    dec rdx
    jmp strncmp_start

strncmp_end:
    mov r8b, byte [rdi]
    mov r9b, byte [rsi]
    add eax, r8d
    sub eax, r9d
    leave
    ret