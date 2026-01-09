include(`commons.m4')$LC0:
	.ascii	"a=%d; b=%d; c=%d\000"
main:
; _EN(`function prologue')_RU(`пролог функции'):
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
; _EN(`load address of the text string')_RU(`загрузить адрес текстовой строки'):
	lui	$2,%hi($LC0)
	addiu	$2,$2,%lo($LC0)
; _EN(`set 1st argument of')_RU(`установить первый аргумент') printf():
	move	$4,$2
; _EN(`set 2nd argument of')_RU(`установить второй аргумент') printf():
	li	$5,1			# 0x1
; _EN(`set 3rd argument of')_RU(`установить третий аргумент') printf():
	li	$6,2			# 0x2
; _EN(`set 4th argument of')_RU(`установить четвертый аргумент') printf():
	li	$7,3			# 0x3
; _EN(`get address of')_RU(`получить адрес') printf():
	lw	$2,%call16(printf)($28)
	nop
; _EN(`call')_RU(`вызов') printf():
	move	$25,$2
	jalr	$25
	nop

; _EN(`function epilogue')_RU(`эпилог функции'):
	lw	$28,16($fp)
; _EN(`set return value to')_RU(`установить возвращаемое значение в') 0:
	move	$2,$0
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
; _return
	j	$31
	nop
