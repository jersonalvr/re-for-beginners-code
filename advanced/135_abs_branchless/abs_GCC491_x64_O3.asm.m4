include(`commons.m4')my_abs:
	mov	edx, edi
	mov	eax, edi
	sar	edx, 31
; _EN(`EDX is 0xFFFFFFFF here if sign of input value is minus')_RU(`EDX здесь 0xFFFFFFFF если знак входного значения -- минус')
; _EN(`EDX is 0 if sign of input value is plus (including 0)')_RU(`EDX ноль если знак входного значения -- плюс (включая ноль)')
; _EN(`the following two instructions have effect only if EDX is 0xFFFFFFFF')_RU(`следующие две инструкции имеют эффект только если EDX равен 0xFFFFFFFF')
; _EN(`or idle if EDX is 0')_RU(``либо не работают, если EDX -- ноль'')
	xor	eax, edx
	sub	eax, edx
	ret
