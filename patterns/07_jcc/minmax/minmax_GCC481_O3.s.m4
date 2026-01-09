include(`commons.m4')my_max:
	mov	edx, DWORD PTR [esp+4]
	mov	eax, DWORD PTR [esp+8]
; EDX=A
; EAX=B
; _EN(`compare A and B')_RU(`сравнить A и B'):
	cmp	edx, eax
; _if A>=B, _EN(`load A value into EAX')_RU(`загрузить значение A в EAX')
; _EN(`the instruction idle if otherwise')_RU(``в противном случае, эта инструкция ничего не делает'') (_if A<B)
	cmovge	eax, edx
	ret

my_min:
	mov	edx, DWORD PTR [esp+4]
	mov	eax, DWORD PTR [esp+8]
; EDX=A
; EAX=B
; _EN(`compare A and B')_RU(`сравнить A и B'):
	cmp	edx, eax
; _if A<=B, _EN(`load A value into EAX')_RU(`загрузить значение A в EAX')
; _EN(`the instruction idle if otherwise')_RU(``в противном случае, эта инструкция ничего не делает'') (_if A>B)
	cmovle	eax, edx
	ret
