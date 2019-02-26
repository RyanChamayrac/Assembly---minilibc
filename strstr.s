BITS 64

SECTION .text

GLOBAL strstr:function

strstr:
    PUSH    rbp
    MOV     rbp, rsp
    XOR     rax, rax

loop:
    cmp     BYTE[rdi], 0
    je      return
    cmp     BYTE[rdi], sil
    je      comparestr
    inc     rax
    inc     rdi
    jmp     loop

comparestr:
	cmp     BYTE[rdi], 0
	je      return
	cmp     BYTE[rsi], 0
	je      return
	cmp     BYTE[rdi], sil
	je      inc
	jne     loop

inc:
	inc     rdi
	jmp     comparestr

return:
    mov     rsp, rbp
    pop     rbp
    ret