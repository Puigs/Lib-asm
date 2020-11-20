BITS 64
SECTION .text

GLOBAL strstr

strstr:
    push rbp,
    mov rbp, rsp
    xor r8, r8
    xor r9, r9
    xor r10, r10
    xor r11, r11
    xor r12, r12
    mov rax, 0
    cmp rdi, 0
    je strstr_end
    cmp rsi, 0
    je strstr_null
    cmp [rsi], byte 0
    je strstr_null

strstr_start:
    cmp [rdi], byte 0
    je strstr_end
    mov r10b, byte [rsi]
    cmp byte [rdi], r10b
    je strstr_before_loop
    inc rdi
    jmp strstr_start

strstr_before_loop:
    mov rax, rdi
    mov r8, rdi
    mov r12 , rsi
    jmp strstr_loop

strstr_loop:
    cmp [r12], byte 0
    je strstr_end
    mov r9b, byte [r12]
    mov r11b, byte [r8]
    cmp r9b, r11b
    jne strstr_set_null
    inc r8
    inc r12
    jmp strstr_loop

strstr_set_null:
    mov rax, 0
    inc rdi
    jmp strstr_start

strstr_null:
    mov rax, rdi

strstr_end:
    leave
    ret