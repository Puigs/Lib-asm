BITS 64
SECTION .text

GLOBAL rindex

rindex:
    push rbp,
    mov rbp, rsp
    mov rax, 0
    cmp rdi, 0
    je rindex_end
    cmp sil, 0
    je rindex_end

rindex_start:
    cmp [rdi], byte 0
    je rindex_end
    mov r10b, byte [rdi]
    cmp r10b, sil 
    je rindex_save
    inc rdi
    jmp rindex_start

rindex_save:
    mov rax, rdi
    inc rdi
    jmp rindex_start

rindex_end:
    leave
    ret
