include(`commons.m4').text:00000000 f:
; $a0=a
; $a1=b
; $a2=c
.text:00000000                 mult    $a1, $a0
.text:00000004                 mflo    $v0
.text:00000008                 jr      $ra
.text:0000000C                 addu    $v0, $a2, $v0	; branch delay slot
; _EN(`result in \$v0 upon return')_RU(`результат в \$v0 во время выхода')_ES(`resultado en \$v0 al retornar')

.text:00000010 main:
.text:00000010
.text:00000010 var_10          = -0x10
.text:00000010 var_4           = -4
.text:00000010
.text:00000010                 lui     $gp, (__gnu_local_gp >> 16)
.text:00000014                 addiu   $sp, -0x20
.text:00000018                 la      $gp, (__gnu_local_gp & 0xFFFF)
.text:0000001C                 sw      $ra, 0x20+var_4($sp)
.text:00000020                 sw      $gp, 0x20+var_10($sp)
; _EN(`set')_RU(`установить')_ES(`establecer') c:
.text:00000024                 li      $a2, 3
; _EN(`set')_RU(`установить')_ES(`establecer') a:
.text:00000028                 li      $a0, 1
.text:0000002C                 jal     f
; _EN(`set')_RU(`установить')_ES(`establecer') b:
.text:00000030                 li      $a1, 2		; branch delay slot
; _EN(`result in \$v0 now')_RU(`результат сейчас в \$v0')_ES(`el resultado está en \$v0 ahora')
.text:00000034                 lw      $gp, 0x20+var_10($sp)
.text:00000038                 lui     $a0, ($LC0 >> 16)
.text:0000003C                 lw      $t9, (printf & 0xFFFF)($gp)
.text:00000040                 la      $a0, ($LC0 & 0xFFFF)
.text:00000044                 jalr    $t9
; _EN(`take result of f() function and pass it as a second argument to printf():')_RU(`взять результат ф-ции f() и передать его как второй аргумент в printf():')_ES(`tomar el resultado de la función f() y pasarlo como segundo argumento a printf():')
.text:00000048                 move    $a1, $v0		; branch delay slot
.text:0000004C                 lw      $ra, 0x20+var_4($sp)
.text:00000050                 move    $v0, $zero
.text:00000054                 jr      $ra
.text:00000058                 addiu   $sp, 0x20	; branch delay slot
