BITS 64

SECTION .text

GLOBAL memcpy

memcpy:
    PUSH    rbp
    MOV     rbp, rsp
    XOR     rax, rax

loop:
	cmp     BYTE[rdx], 0
	je      return
    mov     dil, sil
    jmp     return

return:
    mov     rsp, rbp
    pop     rbp
    ret