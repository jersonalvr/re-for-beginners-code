include(`commons.m4')my_atoi:
; _EN(`load input character into')_RU(`загрузить входной символ в') EDX
	movsx	edx, BYTE PTR [rdi]
; EAX _EN(`is allocated for "rt" variable')_RU(`выделен для переменной "rt"')
	xor	eax, eax
; _EN(``exit, if loaded character is null byte'')_RU(``выйти, если загруженный символ - это нулевой байт'')
	test	dl, dl
	je	.L4
.L3:
	lea	eax, [rax+rax*4]
; EAX=RAX*5=rt*5
; _EN(`shift pointer to the next character')_RU(`передвинуть указатель на следующий символ'):
	add	rdi, 1
	lea	eax, [rdx-48+rax*2]
; EAX=_EN(`input character')_RU(`входной символ') - 48 + RAX*2 = _EN(`input character')_RU(`входной символ') - '0' + rt*10
; _EN(`load next character')_RU(`загрузить следующий символ'):
	movsx	edx, BYTE PTR [rdi]
; _EN(``goto loop begin, if loaded character is not null byte'')_RU(``перейти на начало цикла, если загруженный символ - это не нулевой байт'')
	test	dl, dl
	jne	.L3
	rep ret
.L4:
	rep ret
