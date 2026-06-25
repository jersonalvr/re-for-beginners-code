include(`commons.m4').text:00000000 main:
.text:00000000
.text:00000000 var_10          = -0x10
.text:00000000 var_4           = -4
.text:00000000
; _EN(`function prologue')_RU(`пролог функции')_ES(`prólogo de la función'):
.text:00000000                 lui     $gp, (__gnu_local_gp >> 16)
.text:00000004                 addiu   $sp, -0x20
.text:00000008                 la      $gp, (__gnu_local_gp & 0xFFFF)
.text:0000000C                 sw      $ra, 0x20+var_4($sp)
.text:00000010                 sw      $gp, 0x20+var_10($sp)
; _EN(`load address of')_RU(`загрузить адрес')_ES(`cargar dirección de') printf():
.text:00000014                 lw      $t9, (printf & 0xFFFF)($gp)
; _EN(`load address of the text string and set 1st argument of')_RU(`загрузить адрес текстовой строки и установить первый аргумент')_ES(`cargar dirección de la cadena de texto y establecer el 1er argumento de') printf():
.text:00000018                 la      $a0, $LC0        # "a=%d; b=%d; c=%d"
; _EN(`set 2nd argument of')_RU(`установить второй аргумент')_ES(`establecer el 2do argumento de') printf():
.text:00000020                 li      $a1, 1
; _EN(`set 3rd argument of')_RU(`установить третий аргумент')_ES(`establecer el 3er argumento de') printf():
.text:00000024                 li      $a2, 2
; _EN(`call')_RU(`вызов')_ES(`llamada a') printf():
.text:00000028                 jalr    $t9
; _EN(`set 4th argument of')_RU(`установить четвертый аргумент')_ES(`establecer el 4to argumento de') printf() (branch delay slot):
.text:0000002C                 li      $a3, 3
; _EN(`function epilogue')_RU(`эпилог функции')_ES(`epílogo de la función'):
.text:00000030                 lw      $ra, 0x20+var_4($sp)
; _EN(`set return value to')_RU(`установить возвращаемое значение в')_ES(`establecer valor de retorno a') 0:
.text:00000034                 move    $v0, $zero
; _return
.text:00000038                 jr      $ra
.text:0000003C                 addiu   $sp, 0x20 ; branch delay slot
