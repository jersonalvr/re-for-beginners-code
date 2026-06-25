include(`commons.m4').LC0:
	.string	"Enter X:"
.LC1:
	.string	"%d"
.LC2:
	.string	"You entered %d...\n"
scanf_main:
; _EN(``subtract 32 from SP, then save FP and LR in stack frame'')_RU(``вычесть 32 из SP, затем сохранить FP и LR в стековом фрейме'')_ES(``restar 32 de SP, luego guardar FP y LR en el marco de pila''):
	stp	x29, x30, [sp, -32]!
; _EN(`set stack frame')_RU(`установить стековый фрейм')_ES(`configurar el marco de pila') (FP=SP)
	add	x29, sp, 0
; _EN(`load pointer to the "Enter X:" string:')_RU(`загрузить указатель на строку "Enter X:"')_ES(`cargar puntero a la cadena "Enter X:":')
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
; X0=_EN(`pointer to the "Enter X:" string')_RU(`указатель на строку "Enter X:"')_ES(`puntero a la cadena "Enter X:"')
; _EN(`print it')_RU(`вывести её')_ES(`imprimirla'):
	bl	puts
; _EN(`load pointer to the "\%d" string')_RU(`загрузить указатель на строку "\%d"')_ES(`cargar puntero a la cadena "\%d"'):
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
; _EN(`find a space in stack frame for "x" variable')_RU(`найти место в стековом фрейме для переменной "x"')_ES(`encontrar un espacio en el marco de pila para la variable "x"') (X1=FP+28):
	add	x1, x29, 28
; X1=_EN(`address of "x" variable')_RU(`адрес переменной "x"')_ES(`dirección de la variable "x"')
; _EN(`pass the address to scanf() and call it')_RU(`передать адрес в scanf() и вызвать её')_ES(`pasar la dirección a scanf() y llamarla'):
	bl	__isoc99_scanf
; _EN(`load 32-bit value from the variable in stack frame')_RU(`загрузить 32-битное значение из переменной в стековом фрейме')_ES(`cargar el valor de 32 bits de la variable en el marco de pila'):
	ldr	w1, [x29,28]
; W1=x
; _EN(`load pointer to the "You entered \%d...\textbackslash{}n" string')_RU(`загрузить указатель на строку "You entered \%d...\textbackslash{}n"')_ES(`cargar puntero a la cadena "You entered \%d...\textbackslash{}n"')
; printf() _EN(`will take text string from X0 and "x" variable from X1 (or W1)')_RU(`возьмет текстовую строку из X0 и переменную "x" из X1 (или W1)')_ES(`tomará la cadena de texto de X0 y la variable "x" de X1 (o W1)')
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
; _return 0
	mov	w0, 0
; _EN(``restore FP and LR, then add 32 to SP'')_RU(``восстановить FP и LR, затем прибавить 32 к SP'')_ES(``restaurar FP y LR, luego sumar 32 a SP''):
	ldp	x29, x30, [sp], 32
	ret
