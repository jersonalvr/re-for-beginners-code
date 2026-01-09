include(`commons.m4')my_max:
; RDI=A
; RSI=B
; _EN(`compare A and B')_RU(`сравнить A и B'):
	cmp	rdi, rsi
; _EN(`prepare B in RAX for return')_RU(`подготовить B в RAX для возврата'):
	mov	rax, rsi
; _if() A>=B, _EN(`put')_RU(`оставить') A (RDI) _in() RAX _EN(`for return')_RU(`для возврата').
; _EN(`this instruction is idle if otherwise')_RU(``в противном случае, инструкция ничего не делает'') (_if() A<B)
	cmovge	rax, rdi
	ret

my_min:
; RDI=A
; RSI=B
; _EN(`compare A and B')_RU(`сравнить A и B'):
	cmp	rdi, rsi
; _EN(`prepare B in RAX for return')_RU(`подготовить B в RAX для возврата'):
	mov	rax, rsi
; _if() A<=B, _EN(`put')_RU(`оставить') A (RDI) _in() RAX _EN(`for return')_RU(`для возврата').
; _EN(`this instruction is idle if otherwise')_RU(``в противном случае, инструкция ничего не делает'') (_if() A>B)
	cmovle	rax, rdi
	ret
