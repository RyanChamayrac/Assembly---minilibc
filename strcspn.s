BITS 64

SECTION .text

GLOBAL strcspn

strcspn:
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
	je      loop
	inc     rcx
	jmp     compare

reset:
	XOR     rcx, rcx
	inc     rax
	jmp     loop

return:
    mov     rsp, rbp
    pop     rbp
    ret