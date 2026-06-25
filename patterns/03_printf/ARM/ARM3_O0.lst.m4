include(`commons.m4').LC1:
	.string	"a=%d; b=%d; c=%d"
f2:
; _EN(`save FP and LR in stack frame')_RU(`сохранить FP и LR в стековом фрейме')_ES(`guardar FP y LR en el marco de pila'):
	stp	x29, x30, [sp, -16]!
; _EN(`set stack frame')_RU(`установить стековый фрейм')_ES(`configurar el marco de pila') (FP=SP):
	add	x29, sp, 0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	mov	w1, 1
	mov	w2, 2
	mov	w3, 3
	bl	printf
	mov	w0, 0
; _EN(`restore FP and LR')_RU(`восстановить FP и LR')_ES(`restaurar FP y LR')
	ldp	x29, x30, [sp], 16
	ret
