include(`commons.m4')$LC0:
	.ascii	"a=%d; b=%d; c=%d\000"
main:
; _EN(`function prologue')_RU(`пролог функции')_ES(`prólogo de la función'):
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-32
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,28($sp)
; _EN(`load address of')_RU(`загрузить адрес')_ES(`cargar dirección de') printf():
	lw	$25,%call16(printf)($28)
; _EN(`load address of the text string and set 1st argument of')_RU(`загрузить адрес текстовой строки и установить первый аргумент')_ES(`cargar dirección de la cadena de texto y establecer el 1er argumento de') printf():
	lui	$4,%hi($LC0)
	addiu	$4,$4,%lo($LC0)
; _EN(`set 2nd argument of')_RU(`установить второй аргумент')_ES(`establecer el 2do argumento de') printf():
	li	$5,1			# 0x1
; _EN(`set 3rd argument of')_RU(`установить третий аргумент')_ES(`establecer el 3er argumento de') printf():
	li	$6,2			# 0x2
; _EN(`call')_RU(`вызов')_ES(`llamada a') printf():
	jalr	$25
; _EN(`set 4th argument of')_RU(`установить четвертый аргумент')_ES(`establecer el 4to argumento de') printf() (branch delay slot):
	li	$7,3			# 0x3

; _EN(`function epilogue')_RU(`эпилог функции')_ES(`epílogo de la función'):
	lw	$31,28($sp)
; _EN(`set return value to')_RU(`установить возвращаемое значение в')_ES(`establecer valor de retorno a') 0:
	move	$2,$0
; _return
	j	$31
	addiu	$sp,$sp,32 ; branch delay slot
