BITS 64
SECTION .text

GLOBAL strchr

strchr:
    push rbp
    mov rbp, rsp
    mov rax, 0
    cmp rdi, 0
    je strchr_end
    cmp byte [rdi], 0
    je strchr_end
    cmp sil, 0
    je strchr_end
    cmp sil, byte 0
    je strchr_end
    jmp strchr_start

strchr_start: 
    cmp byte [rdi], 0
    je strchr_end
    cmp byte [rdi], sil
    je strchr_cpy
    add rdi, 1
    jmp strchr_start

strchr_cpy:
    mov rax, rdi

strchr_end:
;Epilogue
    leave
;Return
    ret
