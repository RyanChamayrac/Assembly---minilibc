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
    cmp     BYTE[rdi], sil
    jmp     compare
    inc     rdi
    inc     rsi
    jmp     loop

compare:
	cmp     BYTE[rsi], 0
	je      incvalue
	cmp     BYTE[rdi], sil
	je      loop
	inc     rsi
	jmp     compare

incvalue:
	inc     rax
	jmp     loop

return:
    mov     rsp, rbp
    pop     rbp
    ret