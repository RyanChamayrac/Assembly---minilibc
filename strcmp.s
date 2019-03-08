BITS 64

SECTION .text

GLOBAL strcmp

strcmp:
    PUSH    rbp
    MOV     rbp, rsp
    XOR     rax, rax

loop:
	mov     r10b, BYTE[rdi]
	mov     r11b, BYTE[rsi]
    cmp     r10b, 0
    je      check
    cmp     r10b, r11b
    jne     sub
    jmp     inc

sub:
	movzx   rbx, r11b
	movzx   rax, r10b
	sub     rax, rbx
	jmp     return

check:
	cmp     r11b, 0
	je      cmp0
	jmp     return

inc:
	inc     rdi
	inc     rsi
	jmp     loop

getvalue:
    mov     rax, rdi
    jmp     return

cmp0:
	mov     rax, 0
	jmp     return

return:
    mov     rsp, rbp
    pop     rbp
    ret