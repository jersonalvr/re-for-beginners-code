include(`commons.m4')	.comm	x,4,4
.LC0:
	.string	"Enter X:"
.LC1:
	.string	"%d"
.LC2:
	.string	"You entered %d...\n"
f5:
; _EN(`save FP and LR in stack frame')_RU(`сохранить FP и LR в стековом фрейме')_ES(`guardar FP y LR en el marco de pila'):
	stp	x29, x30, [sp, -16]!
; _EN(`set stack frame')_RU(`установить стековый фрейм')_ES(`establecer el marco de pila') (FP=SP)
	add	x29, sp, 0
; _EN(`load pointer to the "Enter X:" string')_RU(`загрузить указатель на строку "Enter X:"')_ES(`cargar puntero a la cadena "Enter X:"'):
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	puts
; _EN(`load pointer to the "\%d" string')_RU(`загрузить указатель на строку "\%d"')_ES(`cargar puntero a la cadena "\%d"'):
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
; _EN(`form address of x global variable')_RU(`сформировать адрес глобальной переменной x')_ES(`formar la dirección de la variable global x'):
	adrp	x1, x
	add	x1, x1, :lo12:x
	bl	__isoc99_scanf
; _EN(`form address of x global variable again')_RU(`снова сформировать адрес глобальной переменнной x')_ES(`formar de nuevo la dirección de la variable global x'):
	adrp	x0, x
	add	x0, x0, :lo12:x
; _EN(`load value from memory at this address')_RU(`загрузить значение из памяти по этому адресу')_ES(`cargar valor de la memoria en esta dirección'):
	ldr	w1, [x0]
; _EN(`load pointer to the "You entered \%d...\textbackslash{}n" string')_RU(`загрузить указатель на строку "You entered \%d...\textbackslash{}n"')_ES(`cargar puntero a la cadena "You entered \%d...\textbackslash{}n"'):
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
; _return 0
	mov	w0, 0
; _EN(`restore FP and LR')_RU(`восстановить FP и LR')_ES(`restaurar FP y LR'):
	ldp	x29, x30, [sp], 16
	ret
