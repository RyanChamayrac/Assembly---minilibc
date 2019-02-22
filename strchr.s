BITS 64

SECTION .text

GLOBAL strchr:function

strchr:
    PUSH    rbp
    MOV     rbp, rsp
    XOR     rax, rax

loop:
    cmp     BYTE[rdi], 0
    je      return
    cmp     BYTE[rdi], sil
    je      getvalue
    inc     rdi
    jmp     loop

getvalue:
    mov     rax, rdi
    jmp     return

return:
    mov     rsp, rbp
    pop     rbp
    ret