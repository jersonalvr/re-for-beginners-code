include(`commons.m4').LC0:
	.string	"it is ten"
.LC1:
	.string	"it is not ten"
f:
.LFB0:
; _EN(`compare input value with')_RU(`сравнить входное значение с') 10
	cmp	DWORD PTR [esp+4], 10
	mov	edx, OFFSET FLAT:.LC1 ; "it is not ten"
	mov	eax, OFFSET FLAT:.LC0 ; "it is ten"
; _EN(``if comparison result is Not Equal, copy EDX value to EAX'')_RU(``если результат сравнение Not Equal (не равно), скопировать значение из EDX в EAX'')
; _EN(``if not, do nothing'')_RU(``а если нет, то ничего не делать'')
	cmovne	eax, edx
	ret
