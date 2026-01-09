include(`commons.m4')f:
	xor	eax, eax	; _EN(`rt variable will be in EAX register')_RU(`переменная rt будет находиться в регистре EAX')
	xor	ecx, ecx	; _EN(`i variable will be in ECX register')_RU(`переменная i будет находиться в регистре ECX')
.L3:
	mov	rsi, rdi	; _EN(`load input value')_RU(`загрузить входное значение')
	lea	edx, [rax+1]	; EDX=EAX+1
; _EN(``EDX here is a "new version of rt", which will be written into rt variable, if the last bit is 1'')_RU(``EDX здесь это "новая версия rt", которая будет записана в переменную rt, если последний бит был 1'')
	shr	rsi, cl		; RSI=RSI>>CL
	and	esi, 1		; ESI=ESI&1
; _EN(``the last bit is 1? If so, write "new version of rt" into EAX'')_RU(``последний бит был 1? Тогда записываем "новую версию rt" в EAX'')
	cmovne	eax, edx
	add	rcx, 1		; RCX++
	cmp	rcx, 64
	jne	.L3
	rep ret			; AKA fatret
