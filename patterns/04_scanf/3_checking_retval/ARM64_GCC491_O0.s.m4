include(`commons.m4').LC0:
	.string	"Enter X:"
.LC1:
	.string	"%d"
.LC2:
	.string	"You entered %d...\n"
.LC3:
	.string	"What you entered? Huh?"
f6:
; _EN(`save FP and LR in stack frame')_RU(`сохранить FP и LR в стековом фрейме')_ES(`guardar FP y LR en el marco de pila'):
	stp	x29, x30, [sp, -32]!
; _EN(`set stack frame')_RU(`установить стековый фрейм')_ES(`establecer el marco de pila') (FP=SP)
	add	x29, sp, 0
; _EN(`load pointer to the "Enter X:" string:')_RU(`загрузить указатель на строку "Enter X:"')_ES(`cargar puntero a la cadena "Enter X:":')
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	puts
; _EN(`load pointer to the "\%d" string')_RU(`загрузить указатель на строку "\%d"')_ES(`cargar puntero a la cadena "\%d"'):
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
; _EN(`calculate address of x variable in the local stack')_RU(`вычислить адрес переменной x в локальном стеке')_ES(`calcular la dirección de la variable x en la pila local')
	add	x1, x29, 28
	bl	__isoc99_scanf
; scanf() _EN(`returned result in')_RU(`возвращает результат в')_ES(`devuelve el resultado en') W0.
; _EN(`check it')_RU(`проверяем его')_ES(`comprobarlo'):
	cmp	w0, 1
; BNE _EN(`is')_RU(`это')_ES(`es') Branch if Not Equal _RU(``(переход, если не равно)'')_ES(``(saltar si no es igual)'')
; _EN(`so if')_RU(`так что если')_ES(`así que si') W0<>0, _EN(`jump to L2 will be occurred')_RU(`произойдет переход на L2')_ES(`se producirá el salto a L2')
	bne	.L2
; _EN(`at this moment')_RU(`в этот момент')_ES(`en este momento') W0=1, _EN(`meaning no error')_RU(``означая, что ошибки не было'')_ES(``lo que significa que no hubo error'')
; _EN(`load x value from the local stack')_RU(`загрузить значение x из локального стека')_ES(`cargar el valor de x de la pila local')
	ldr	w1, [x29,28]
; _EN(`load pointer to the "You entered \%d...\textbackslash{}n" string')_RU(`загрузить указатель на строку "You entered \%d...\textbackslash{}n"')_ES(`cargar puntero a la cadena "You entered \%d...\textbackslash{}n"'):
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
; _EN(``skip the code, which print the'')_RU(``пропустить код, печатающий строку'')_ES(``omitir el código que imprime la cadena'') "What you entered? Huh?" _EN(`string')_ES(``''):
	b	.L3
.L2:
; _EN(`load pointer to the')_RU(`загрузить указатель на строку')_ES(`cargar puntero a la cadena') "What you entered? Huh?" _EN(`string')_ES(``''):
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	puts
.L3:
; _return 0
	mov	w0, 0
; _EN(`restore FP and LR')_RU(`восстановить FP и LR')_ES(`restaurar FP y LR'):
	ldp	x29, x30, [sp], 32
	ret
