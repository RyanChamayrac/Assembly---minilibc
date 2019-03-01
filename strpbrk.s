BITS 64

SECTION .text

GLOBAL strpbrk

strpbrk:
    PUSH    rbp
    MOV     rbp, rsp
    XOR     rax, rax

loop:
    cmp     BYTE[rdi], 0
    je      return
    inc     rdi
    jmp     compare

compare:
	mov     r10b, [rsi + rcx]
	cmp     r10b, 0
	je      reset
	cmp     r10b, BYTE[rdi]
	je      getvalue
	inc     rcx
	jmp     compare

reset:
	XOR     rcx, rcx
	jmp     loop

getvalue:
    mov     rax, rdi
    jmp     return

return:
    mov     rsp, rbp
    pop     rbp
    ret