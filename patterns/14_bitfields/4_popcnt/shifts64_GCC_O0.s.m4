include(`commons.m4')f:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR [rbp-24], rdi	; a
	mov	DWORD PTR [rbp-12], 0	; rt=0
	mov	QWORD PTR [rbp-8], 0	; i=0
	jmp	.L2
.L4:
	mov	rax, QWORD PTR [rbp-8]
	mov	rdx, QWORD PTR [rbp-24]
; RAX = i, RDX = a
	mov	ecx, eax
; ECX = i
	shr	rdx, cl
; RDX = RDX>>CL = a>>i
	mov	rax, rdx
; RAX = RDX = a>>i
	and	eax, 1
; EAX = EAX&1 = (a>>i)&1
	test	rax, rax
; _EN(`the last bit is zero')_RU(`последний бит был нулевым')?
; _EN(``skip the next ADD instruction, if it was so'')_RU(``пропустить следующую инструкцию ADD, если это было так'').
	je	.L3	
	add	DWORD PTR [rbp-12], 1	; rt++
.L3:
	add	QWORD PTR [rbp-8], 1	; i++
.L2:
	cmp	QWORD PTR [rbp-8], 63	; i<63?
	jbe	.L4			; _EN(``jump to the loop body begin, if so'')_RU(``перейти на начало тела цикла, если это так'')
	mov	eax, DWORD PTR [rbp-12]	; _return rt
	pop	rbp
	ret
