BITS 64

SECTION .text

GLOBAL rindex

rindex:
    PUSH    rbp
    MOV     rbp, rsp
    XOR     rax, rax

loop:
    cmp     BYTE[rdi], 0
    je      find
    inc     rdi
    jmp     loop

find:
	dec     rdi
	cmp     BYTE[rdi], 0
	je      return
	cmp     BYTE[rdi], sil
	je      getvalue
	jmp     loop

getvalue:
    mov     rax, rdi
    jmp     return

return:
    mov     rsp, rbp
    pop     rbp
    ret