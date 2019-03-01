BITS 64

SECTION .text

GLOBAL strstr

strstr:
    PUSH    rbp
    MOV     rbp, rsp
    XOR     rax, rax

loop:
    cmp     BYTE[rdi], 0
    je      return
    cmp     BYTE[rdi], sil
    je      comparestr
    inc     rdi
    jmp     loop

comparestr:
	cmp     BYTE[rdi], 0
	je      returnvalue
	cmp     BYTE[rsi], 0
	je      returnvalue
	cmp     BYTE[rdi], sil
	je      inc
	jne     loop

inc:
	inc     rdi
	inc     rsi
	jmp     comparestr

returnvalue:
	mov     rax, rsi
	jmp     return

return:
    mov     rsp, rbp
    pop     rbp
    ret