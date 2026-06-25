include(`commons.m4').text:00000000 main:
.text:00000000
.text:00000000 var_18          = -0x18
.text:00000000 var_10          = -0x10
.text:00000000 var_4           = -4
.text:00000000
; _EN(`function prologue')_RU(`пролог функции')_ES(`prólogo de la función'):
.text:00000000                 lui     $gp, (__gnu_local_gp >> 16)
.text:00000004                 addiu   $sp, -0x28
.text:00000008                 la      $gp, (__gnu_local_gp & 0xFFFF)
.text:0000000C                 sw      $ra, 0x28+var_4($sp)
.text:00000010                 sw      $gp, 0x28+var_18($sp)
; _EN(`call')_RU(`вызов')_ES(`llamada a') puts():
.text:00000014                 lw      $t9, (puts & 0xFFFF)($gp)
.text:00000018                 lui     $a0, ($LC0 >> 16)  # "Enter X:"
.text:0000001C                 jalr    $t9  
.text:00000020                 la      $a0, ($LC0 & 0xFFFF)  # "Enter X:" ; branch delay slot
; _EN(`call')_RU(`вызов')_ES(`llamada a') scanf():
.text:00000024                 lw      $gp, 0x28+var_18($sp)
.text:00000028                 lui     $a0, ($LC1 >> 16)  # "%d"
.text:0000002C                 lw      $t9, (__isoc99_scanf & 0xFFFF)($gp)
; _EN(`set 2nd argument of')_RU(`установить второй аргумент для')_ES(`establecer el 2do argumento de') scanf(), $a1=$sp+24:
.text:00000030                 addiu   $a1, $sp, 0x28+var_10
.text:00000034                 jalr    $t9  ; branch delay slot
.text:00000038                 la      $a0, ($LC1 & 0xFFFF)  # "%d"
; _EN(`call')_RU(`вызов')_ES(`llamada a') printf():
.text:0000003C                 lw      $gp, 0x28+var_18($sp)
; _EN(`set 2nd argument of')_RU(`установить второй аргумент для')_ES(`establecer el 2do argumento de') printf(), 
; _EN(`load word at address')_RU(`загрузить слово по адресу')_ES(`cargar palabra en la dirección') $sp+24:
.text:00000040                 lw      $a1, 0x28+var_10($sp)
.text:00000044                 lw      $t9, (printf & 0xFFFF)($gp)
.text:00000048                 lui     $a0, ($LC2 >> 16)  # "You entered %d...\n"
.text:0000004C                 jalr    $t9
.text:00000050                 la      $a0, ($LC2 & 0xFFFF)  # "You entered %d...\n" ; branch delay slot
; _EN(`function epilogue')_RU(`эпилог функции')_ES(`epílogo de la función'):
.text:00000054                 lw      $ra, 0x28+var_4($sp)
; _EN(`set return value to')_RU(`установить возвращаемое значение в')_ES(`establecer valor de retorno a') 0:
.text:00000058                 move    $v0, $zero
; _return:
.text:0000005C                 jr      $ra
.text:00000060                 addiu   $sp, 0x28 ; branch delay slot
