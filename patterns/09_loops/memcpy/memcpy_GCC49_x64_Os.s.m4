include(`commons.m4')my_memcpy:
; RDI = _EN(`destination address')_RU(`целевой адрес')
; RSI = _EN(`source address')_RU(`исходный адрес')
; RDX = _EN(`size of block')_RU(`размер блока')

; _EN(`initialize counter (i) at 0')_RU(`инициализировать счетчик (i) в 0')
	xor	eax, eax
.L2:
; _EN(`all bytes copied? exit then:')_RU(`все байты скопированы? тогда заканчиваем:')
	cmp	rax, rdx
	je	.L5
; _EN(`load byte at')_RU(`загружаем байт по адресу') RSI+i:
	mov	cl, BYTE PTR [rsi+rax]
; _EN(`store byte at')_RU(`записываем байт по адресу') RDI+i:
	mov	BYTE PTR [rdi+rax], cl
	inc	rax ; i++
	jmp	.L2
.L5:
	ret
