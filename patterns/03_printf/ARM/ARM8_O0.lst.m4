include(`commons.m4').LC2:
	.string	"a=%d; b=%d; c=%d; d=%d; e=%d; f=%d; g=%d; h=%d\n"
f3:
; _EN(`grab more space in stack')_RU(`взять больше места в стеке')_ES(`reservar más espacio en la pila'):
	sub	sp, sp, #32
; _EN(`save FP and LR in stack frame')_RU(`сохранить FP и LR в стековом фрейме')_ES(`guardar FP y LR en el marco de pila'):
	stp	x29, x30, [sp,16]
; _EN(`set stack frame')_RU(`установить стековый фрейм')_ES(`configurar el marco de pila') (FP=SP):
	add	x29, sp, 16
	adrp	x0, .LC2 ; "a=%d; b=%d; c=%d; d=%d; e=%d; f=%d; g=%d; h=%d\n"
	add	x0, x0, :lo12:.LC2
	mov	w1, 8		; _EN(`9th argument')_RU(`9-й аргумент')_ES(`9no argumento')
	str	w1, [sp]	; _EN(`store 9th argument in the stack')_RU(`сохранить 9-й аргумент в стеке')_ES(`guardar el 9no argumento en la pila')
	mov	w1, 1
	mov	w2, 2
	mov	w3, 3
	mov	w4, 4
	mov	w5, 5
	mov	w6, 6
	mov	w7, 7
	bl	printf
	sub	sp, x29, #16
; _EN(`restore FP and LR')_RU(`восстановить FP и LR')_ES(`restaurar FP y LR')
	ldp	x29, x30, [sp,16]
	add	sp, sp, 32
	ret
