include(`commons.m4')$LC0:
	.ascii	"a=%d; b=%d; c=%d; d=%d; e=%d; f=%d; g=%d; h=%d\012\000"
main:
; _EN(`function prologue')_RU(`пролог функции'):
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$fp,48($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	lui	$2,%hi($LC0)
	addiu	$2,$2,%lo($LC0)
; _EN(`pass 5th argument in stack')_RU(`передать 5-й аргумент в стеке'):
	li	$3,4			# 0x4
	sw	$3,16($sp)
; _EN(`pass 6th argument in stack')_RU(`передать 6-й аргумент в стеке'):
	li	$3,5			# 0x5
	sw	$3,20($sp)
; _EN(`pass 7th argument in stack')_RU(`передать 7-й аргумент в стеке'):
	li	$3,6			# 0x6
	sw	$3,24($sp)
; _EN(`pass 8th argument in stack')_RU(`передать 8-й аргумент в стеке'):
	li	$3,7			# 0x7
	sw	$3,28($sp)
; _EN(`pass 9th argument in stack')_RU(`передать 9-й аргумент в стеке'):
	li	$3,8			# 0x8
	sw	$3,32($sp)
; _EN(`pass 1st argument in')_RU(`передать 1-й аргумент в') $a0: 
	move	$4,$2
; _EN(`pass 2nd argument in')_RU(`передать 2-й аргумент в') $a1:
	li	$5,1			# 0x1
; _EN(`pass 3rd argument in')_RU(`передать 3-й аргумент в') $a2:
	li	$6,2			# 0x2
; _EN(`pass 4th argument in')_RU(`передать 4-й аргумент в') $a3:
	li	$7,3			# 0x3
; _EN(`call')_RU(`вызов') printf():
	lw	$2,%call16(printf)($28)
	nop
	move	$25,$2
	jalr	$25
	nop
; _EN(`function epilogue')_RU(`эпилог функции'):
	lw	$28,40($fp)
; _EN(`set return value to')_RU(`установить возвращаемое значение в') 0:
	move	$2,$0
	move	$sp,$fp
	lw	$31,52($sp)
	lw	$fp,48($sp)
	addiu	$sp,$sp,56
; _return
	j	$31
	nop
