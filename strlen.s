BITS 64

SECTION .text

GLOBAL strlen:function

strlen:
    PUSH    rbp
    MOV     rbp, rsp
    XOR     rax, rax

loop:
    cmp     BYTE[rdi], 0
    je      return
    inc     rax
    inc     rdi
    jmp     loop

return:
    mov     rsp, rbp
    pop     rbp
    ret