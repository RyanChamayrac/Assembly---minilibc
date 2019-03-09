BITS 64

SECTION .text

GLOBAL memcpy

memcpy:
    PUSH    rbp
    MOV     rbp, rsp
    MOV     rax, rdi

loop:
    cmp     rdx, 0
    je      return
    mov     r8b, BYTE[rsi]
    mov     BYTE[rdi], r8b
    inc     rdi
    inc     rsi
    dec     rdx
    jmp     loop

return:
	mov     rax, rdi
    mov     rsp, rbp
    pop     rbp
    ret