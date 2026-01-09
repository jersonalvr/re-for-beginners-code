include(`commons.m4')$LC0:
	.ascii	"Enter X:\000"
$LC1:
	.ascii	"%d\000"
$LC2:
	.ascii	"You entered %d...\012\000"
main:
; _EN(`function prologue')_RU(`пролог функции'):
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-40
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,36($sp)
; _EN(`call')_RU(`вызов') puts():
	lw	$25,%call16(puts)($28)
	lui	$4,%hi($LC0)
	jalr	$25
	addiu	$4,$4,%lo($LC0) ; branch delay slot
; _EN(`call')_RU(`вызов') scanf():
	lw	$28,16($sp)
	lui	$4,%hi($LC1)
	lw	$25,%call16(__isoc99_scanf)($28)
; _EN(`set 2nd argument of')_RU(`установить второй аргумент для') scanf(), $a1=$sp+24:
	addiu	$5,$sp,24
	jalr	$25
	addiu	$4,$4,%lo($LC1) ; branch delay slot

; _EN(`call')_RU(`вызов') printf():
	lw	$28,16($sp)
; _EN(`set 2nd argument of')_RU(`установить второй аргумент для') printf(), 
; _EN(`load word at address')_RU(`загрузить слово по адресу') $sp+24:
	lw	$5,24($sp)
	lw	$25,%call16(printf)($28)
	lui	$4,%hi($LC2)
	jalr	$25
	addiu	$4,$4,%lo($LC2) ; branch delay slot

; _EN(`function epilogue')_RU(`эпилог функции'):
	lw	$31,36($sp)
; _EN(`set return value to')_RU(`установить возвращаемое значение в') 0:
	move	$2,$0
; _return:
	j	$31
	addiu	$sp,$sp,40      ; branch delay slot
