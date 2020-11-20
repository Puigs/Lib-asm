BITS 64
SECTION .text

GLOBAL strcasecmp

strcasecmp:
    push rbp
    mov rbp, rsp
    mov eax, 0
    mov r10b, 0
    mov r11b, 0
    cmp rdi, 0
    je strcasecmp_end
    cmp rsi, 0
    je strcasecmp_end

strcasecmp_start:
    cmp [rdi], byte 0
    je strcasecmp_end
    cmp [rsi], byte 0
    je strcasecmp_end
    mov r10b, byte [rdi]
    mov r11b, byte [rsi]
    cmp r10b, r11b
    jne strcasecmp_diff
    inc rdi
    inc rsi
    jmp strcasecmp_start

strcasecmp_diff:
    sub r11d, 32
    cmp r10d, r11d
    je strcasecmp_more
    add r11d, 64
    cmp r10d, r11d
    je strcasecmp_more
    jmp strcasecmp_end

strcasecmp_more:
     inc rdi
     inc rsi
     jmp strcasecmp_start

strcasecmp_end:
    mov r8b, byte [rdi]
    mov r9b, byte [rsi]
    add eax, r8d
    sub eax, r9d
    leave
    ret