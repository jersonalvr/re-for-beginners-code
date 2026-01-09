include(`commons.m4'); RDI=_EN(`_EN(`address of array')_RU(`адрес массива')')_RU(`адрес массива')
; RSI=a
; RDX=b

get_by_coordinates1:
; _EN(`sign-extend input 32-bit int values "a" and "b" to 64-bit ones')_RU(`расширить входные 32-битные значения "a" и "b" до 64-битных')
	movsx	rsi, esi 
	movsx	rdx, edx
	lea	rax, [rdi+rsi*4]
; RAX=RDI+RSI*4=_EN(`address of array')_RU(`адрес массива')+a*4
	movzx	eax, BYTE PTR [rax+rdx]
; AL=_EN(`load byte at address')_RU(`загрузить байт по адресу') RAX+RDX=_EN(`address of array')_RU(`адрес массива')+a*4+b
	ret

get_by_coordinates2:
	lea	eax, [rdx+rsi*4]
; RAX=RDX+RSI*4=b+a*4
	cdqe
	movzx	eax, BYTE PTR [rdi+rax]
; AL=_EN(`load byte at address')_RU(`загрузить байт по адресу') RDI+RAX=_EN(`address of array')_RU(`адрес массива')+b+a*4
	ret

get_by_coordinates3:
	sal	esi, 2
; ESI=a<<2=a*4
; _EN(`sign-extend input 32-bit int values "a*4" and "b" to 64-bit ones')_RU(`расширить входные 32-битные значения "a*4" и "b" до 64-битных')
	movsx	rdx, edx
	movsx	rsi, esi
	add	rdi, rsi
; RDI=RDI+RSI=_EN(`address of array')_RU(`адрес массива')+a*4
	movzx	eax, BYTE PTR [rdi+rdx]
; AL=_EN(`load byte at address')_RU(`загрузить байт по адресу') RDI+RDX=_EN(`address of array')_RU(`адрес массива')+a*4+b
	ret
