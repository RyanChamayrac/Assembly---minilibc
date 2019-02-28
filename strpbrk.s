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
    cmp     BYTE[rdi], sil
    jmp     compare
    inc     rdi
    inc     rsi
    jmp     loop

compare:
	cmp     BYTE[rsi], 0
	je      loop
	cmp     BYTE[rdi], sil
	je      getvalue
	inc     rsi
	jmp     compare

getvalue:
    mov     rax, rdi
    jmp     return

return:
    mov     rsp, rbp
    pop     rbp
    ret