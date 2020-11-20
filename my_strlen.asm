BITS 64
SECTION .text

GLOBAL strlen

strlen:
;rdi premier argument 
;rsi = 2 argument
;rdx = 3
;rcx = 4
;rax pour return
;Les trois premières lignes peuvent être remplacer par Enter

; Prologue
    push rbp
; stack frame setup
    mov rbp, rsp
    mov rax, 0
; gestion erreur 
    cmp rdi, 0
    je strlen_end

strlen_start:
    cmp [rdi], byte 0
    je strlen_end
    add rdi, 1
    add rax, 1
    jmp strlen_start

strlen_end:
;Epilogue
    leave
;Return
    ret

