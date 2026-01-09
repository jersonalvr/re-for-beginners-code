include(`commons.m4')$LC0:
	.ascii	"a=%d; b=%d; c=%d; d=%d; e=%d; f=%d; g=%d; h=%d\012\000"
main:
; _EN(`function prologue')_RU(`пролог функции'):
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-56
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,52($sp)
; _EN(`pass 5th argument in stack')_RU(`передать 5-й аргумент в стеке'):
	li	$2,4			# 0x4
	sw	$2,16($sp)
; _EN(`pass 6th argument in stack')_RU(`передать 6-й аргумент в стеке'):
	li	$2,5			# 0x5
	sw	$2,20($sp)
; _EN(`pass 7th argument in stack')_RU(`передать 7-й аргумент в стеке'):
	li	$2,6			# 0x6
	sw	$2,24($sp)
; _EN(`pass 8th argument in stack')_RU(`передать 8-й аргумент в стеке'):
	li	$2,7			# 0x7
	lw	$25,%call16(printf)($28)
	sw	$2,28($sp)
; _EN(`pass 1st argument in')_RU(`передать 1-й аргумент в') $a0: 
	lui	$4,%hi($LC0)
; _EN(`pass 9th argument in stack')_RU(`передать 9-й аргумент в стеке'):
	li	$2,8			# 0x8
	sw	$2,32($sp)
	addiu	$4,$4,%lo($LC0)
; _EN(`pass 2nd argument in')_RU(`передать 2-й аргумент в') $a1:
	li	$5,1			# 0x1
; _EN(`pass 3rd argument in')_RU(`передать 3-й аргумент в') $a2:
	li	$6,2			# 0x2
; _EN(`call')_RU(`вызов') printf():
	jalr	$25
; _EN(`pass 4th argument in')_RU(`передать 4-й аргумент в') $a3 (branch delay slot):
	li	$7,3			# 0x3

; _EN(`function epilogue')_RU(`эпилог функции'):
	lw	$31,52($sp)
; _EN(`set return value to')_RU(`установить возвращаемое значение в') 0:
	move	$2,$0
; _return
	j	$31
	addiu	$sp,$sp,56 ; branch delay slot
