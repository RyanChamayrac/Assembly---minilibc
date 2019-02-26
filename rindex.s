BITS 64

SECTION .text

GLOBAL rindex:function

rindex:
    PUSH    rbp
    MOV     rbp, rsp
    XOR     rax, rax

loop:
    cmp     BYTE[rdi], 0
    je      find
    cmp     BYTE[rdi], sil
    je      getvalue
    inc     rdi
    jmp     loop

find:
	cmp     BYTE[rdi], 0
	je      return
	cmp     BYTE[rdi], sil
	je      getvalue
	dec     rdi
	jmp     loop

getvalue:
    mov     rax, rdi
    jmp     return

return:
    mov     rsp, rbp
    pop     rbp
    ret