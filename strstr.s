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
    cmp     BYTE[rsi], 0
    je      return
    jmp     compare

compare:
	mov     r11b, [rdi + rcx]
	cmp     r11b, 0
	je      return
	mov     r10b, [rsi + rcx]
	cmp     r10b, 0
	je      getvalue
	cmp     r10b, r11b
	je      inc
	jmp     reset

inc:
	inc     rcx
	jmp     compare

getvalue:
    mov     rax, rdi
    jmp     return

reset:
	XOR     rcx, rcx
	inc     rdi
	jmp     loop

return:
    mov     rsp, rbp
    pop     rbp
    ret