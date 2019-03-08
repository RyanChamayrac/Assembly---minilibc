BITS 64

SECTION .text

GLOBAL test_memcpy

test_memcpy:
    PUSH    rbp
    MOV     rbp, rsp
    XOR     rcx, rcx

loop:
    cmp     BYTE[rsi + rcx], 0
    je      return
    cmp     rdx, 0
    je      return
    mov     r8b, BYTE[rsi + rcx]
    mov     BYTE[rdi + rcx], r8b
    inc     rcx
    dec     rdx
    jmp     loop

return:
	mov     rax, rdi
    mov     rsp, rbp
    pop     rbp
    ret