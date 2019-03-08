BITS 64

SECTION .text

GLOBAL memset

memset:
    PUSH    rbp
    MOV     rbp, rsp
    XOR     rax, rax

loop:
    cmp     BYTE[rdi], 0
    je      return
    cmp     rdx, 0
    je      return
    mov     BYTE[rdi], sil
    dec     rdx
    jmp     loop

return:
	mov     rax, rdi
    mov     rsp, rbp
    pop     rbp
    ret