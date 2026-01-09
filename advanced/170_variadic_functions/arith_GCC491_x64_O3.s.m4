include(`commons.m4')arith_mean:
	lea	rax, [rsp+8]
	; _RU(`сохранить 6 входных регистров в "red zone" в локальном стеке')_EN(`save 6 input registers in "red zone" in the local stack')
	mov	QWORD PTR [rsp-40], rsi
	mov	QWORD PTR [rsp-32], rdx
	mov	QWORD PTR [rsp-16], r8
	mov	QWORD PTR [rsp-24], rcx
	mov	esi, 8
	mov	QWORD PTR [rsp-64], rax
	lea	rax, [rsp-48]
	mov	QWORD PTR [rsp-8], r9
	mov	DWORD PTR [rsp-72], 8
	lea	rdx, [rsp+8]
	mov	r8d, 1
	mov	QWORD PTR [rsp-56], rax
	jmp	.L5
.L7:
	; _RU(`обработать сохраненные аргументы')_EN(`work out saved arguments')
	lea	rax, [rsp-48]
	mov	ecx, esi
	add	esi, 8
	add	rcx, rax
	mov	ecx, DWORD PTR [rcx]
	cmp	ecx, -1
	je	.L4
.L8:
	add	edi, ecx
	add	r8d, 1
.L5:
	; _RU(``решить, какую часть мы сейчас будем обрабатывать'')_EN(``decide, which part we will work out now.'')
	; _RU(`текущий номер аргумента меньше или равен 6?')_EN(`is current argument number less or equal 6?')
	cmp	esi, 47 
	jbe	.L7 		; _RU(``нет, тогда обрабатываем сохраненные аргументы'')_EN(``no, process saved arguments then'')
	; _RU(`обрабатываем аргументы из стека')_EN(`work out arguments from stack')
	mov	rcx, rdx
	add	rdx, 8
	mov	ecx, DWORD PTR [rcx]
	cmp	ecx, -1
	jne	.L8
.L4:
	mov	eax, edi
	cdq
	idiv	r8d
	ret

.LC1:
	.string	"%d\n"
main:
	sub	rsp, 8
	mov	edx, 7
	mov	esi, 2
	mov	edi, 1
	mov	r9d, -1
	mov	r8d, 15
	mov	ecx, 10
	xor	eax, eax
	call	arith_mean
	mov	esi, OFFSET FLAT:.LC1
	mov	edx, eax
	mov	edi, 1
	xor	eax, eax
	add	rsp, 8
	jmp	__printf_chk
