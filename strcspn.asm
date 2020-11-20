BITS 64
SECTION .text

GLOBAL strcspn

strcspn:
    push rbp,
    mov rbp, rsp
    mov rax, 0
    mov r8, 0
    cmp rdi, 0
    je strcspn_end
    cmp rsi, 0
    je strcspn_end
    mov r8, rsi

strcspn_start:
    cmp [rdi], byte 0
    je strcspn_end
    cmp [r8], byte 0
    je strc_move
    mov r10b, byte [r8]
    cmp byte [rdi], r10b
    je strcspn_end
    inc r8
    jmp strcspn_start
    
strc_move: 
    inc al
    mov r8, rsi
    inc rdi
    jmp strcspn_start

strcspn_end:
    leave
    ret