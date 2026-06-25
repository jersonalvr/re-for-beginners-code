include(`commons.m4').text:00000000 main:
.text:00000000
.text:00000000 var_28          = -0x28
.text:00000000 var_24          = -0x24
.text:00000000 var_20          = -0x20
.text:00000000 var_1C          = -0x1C
.text:00000000 var_18          = -0x18
.text:00000000 var_10          = -0x10
.text:00000000 var_8           = -8
.text:00000000 var_4           = -4
.text:00000000
; _EN(`function prologue')_RU(`пролог функции')_ES(`prólogo de la función'):
.text:00000000                 addiu   $sp, -0x38
.text:00000004                 sw      $ra, 0x38+var_4($sp)
.text:00000008                 sw      $fp, 0x38+var_8($sp)
.text:0000000C                 move    $fp, $sp
.text:00000010                 la      $gp, __gnu_local_gp
.text:00000018                 sw      $gp, 0x38+var_10($sp)
.text:0000001C                 la      $v0, aADBDCDDDEDFDGD  # "a=%d; b=%d; c=%d; d=%d; e=%d; f=%d; g=%"...
; _EN(`pass 5th argument in stack')_RU(`передать 5-й аргумент в стеке')_ES(`pasar el 5to argumento en la pila'):
.text:00000024                 li      $v1, 4
.text:00000028                 sw      $v1, 0x38+var_28($sp)
; _EN(`pass 6th argument in stack')_RU(`передать 6-й аргумент в стеке')_ES(`pasar el 6to argumento en la pila'):
.text:0000002C                 li      $v1, 5
.text:00000030                 sw      $v1, 0x38+var_24($sp)
; _EN(`pass 7th argument in stack')_RU(`передать 7-й аргумент в стеке')_ES(`pasar el 7mo argumento en la pila'):
.text:00000034                 li      $v1, 6
.text:00000038                 sw      $v1, 0x38+var_20($sp)
; _EN(`pass 8th argument in stack')_RU(`передать 8-й аргумент в стеке')_ES(`pasar el 8vo argumento en la pila'):
.text:0000003C                 li      $v1, 7
.text:00000040                 sw      $v1, 0x38+var_1C($sp)
; _EN(`pass 9th argument in stack')_RU(`передать 9-й аргумент в стеке')_ES(`pasar el 9no argumento en la pila'):
.text:00000044                 li      $v1, 8
.text:00000048                 sw      $v1, 0x38+var_18($sp)
; _EN(`pass 1st argument in')_RU(`передать 1-й аргумент в')_ES(`pasar el 1er argumento en') $a0: 
.text:0000004C                 move    $a0, $v0
; _EN(`pass 2nd argument in')_RU(`передать 2-й аргумент в')_ES(`pasar el 2do argumento en') $a1:
.text:00000050                 li      $a1, 1
; _EN(`pass 3rd argument in')_RU(`передать 3-й аргумент в')_ES(`pasar el 3er argumento en') $a2:
.text:00000054                 li      $a2, 2
; _EN(`pass 4th argument in')_RU(`передать 4-й аргумент в')_ES(`pasar el 4to argumento en') $a3:
.text:00000058                 li      $a3, 3
; _EN(`call')_RU(`вызов')_ES(`llamada a') printf():
.text:0000005C                 lw      $v0, (printf & 0xFFFF)($gp)
.text:00000060                 or      $at, $zero
.text:00000064                 move    $t9, $v0
.text:00000068                 jalr    $t9
.text:0000006C                 or      $at, $zero ; NOP
; _EN(`function epilogue')_RU(`эпилог функции')_ES(`epílogo de la función'):
.text:00000070                 lw      $gp, 0x38+var_10($fp)
; _EN(`set return value to')_RU(`установить возвращаемое значение в')_ES(`establecer valor de retorno a') 0:
.text:00000074                 move    $v0, $zero
.text:00000078                 move    $sp, $fp
.text:0000007C                 lw      $ra, 0x38+var_4($sp)
.text:00000080                 lw      $fp, 0x38+var_8($sp)
.text:00000084                 addiu   $sp, 0x38
; _return
.text:00000088                 jr      $ra
.text:0000008C                 or      $at, $zero ; NOP
