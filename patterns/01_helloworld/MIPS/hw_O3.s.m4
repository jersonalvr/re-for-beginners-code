include(`commons.m4')$LC0:
; \000 _EN(`is zero byte in octal base')_RU(`это ноль в восьмиричной системе'):
	.ascii	"Hello, world!\012\000"
main:
; _EN(`function prologue.')_RU(`пролог функции')
; _EN(`set')_RU(`установить') GP:
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-32
	addiu	$28,$28,%lo(__gnu_local_gp)
; _EN(`save RA to the local stack')_RU(`сохранить RA в локальном стеке'):
	sw	$31,28($sp)
; _EN(`load address of puts() function from GP to')_RU(`загрузить адрес функции puts() из GP в') $25:
	lw	$25,%call16(puts)($28)
; _EN(`load address of the text string to')_RU(`загрузить адрес текстовой строки в') $4 ($a0):
	lui	$4,%hi($LC0)
; _EN(``jump to puts(), saving return address in link register'')_RU(``перейти на puts(), сохранив адрес возврата в link-регистре''):
	jalr	$25
	addiu	$4,$4,%lo($LC0) ; branch delay slot
; _EN(`restore')_RU(`восстановить') RA:
	lw	$31,28($sp)
; _EN(`copy 0 from')_RU(`скопировать 0 из') $zero _EN(`to')_RU(`в') $v0:
	move	$2,$0
; _EN(`return by jumping to address in RA')_RU(`вернуть управление сделав переход по адресу в RA'):
	j	$31
; _EN(`function epilogue')_RU(`эпилог функции'):
	addiu	$sp,$sp,32 ; branch delay slot
