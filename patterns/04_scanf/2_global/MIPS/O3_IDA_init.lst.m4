include(`commons.m4').text:004006A0 main:
.text:004006A0
.text:004006A0 var_10          = -0x10
.text:004006A0 var_8           = -8
.text:004006A0 var_4           = -4
.text:004006A0
.text:004006A0                 lui     $gp, 0x42
.text:004006A4                 addiu   $sp, -0x20
; _EN(`prepare high part of x address')_RU(`подготовить старшую часть адреса x')_ES(`preparar la parte alta de la dirección de x'):
.text:004006A8                 li      $gp, 0x418930
.text:004006AC                 sw      $ra, 0x20+var_4($sp)
.text:004006B0                 sw      $s0, 0x20+var_8($sp)
.text:004006B4                 sw      $gp, 0x20+var_10($sp)
.text:004006B8                 la      $t9, puts
.text:004006BC                 lui     $a0, 0x40
.text:004006C0                 jalr    $t9 ; puts
.text:004006C4                 la      $a0, aEnterX     # "Enter X:"
.text:004006C8                 lw      $gp, 0x20+var_10($sp)
.text:004006CC                 lui     $s0, 0x41
.text:004006D0                 la      $t9, __isoc99_scanf
.text:004006D4                 lui     $a0, 0x40
; _EN(`add low part of x address')_RU(`прибавить младшую часть адреса x')_ES(`añadir la parte baja de la dirección de x'):
.text:004006D8                 addiu   $a1, $s0, (x - 0x410000)
; _EN(`now address of x is in')_RU(`теперь адрес x в')_ES(`ahora la dirección de x está en') $a1.
.text:004006DC                 jalr    $t9 ; __isoc99_scanf
.text:004006E0                 la      $a0, aD          # "%d"
.text:004006E4                 lw      $gp, 0x20+var_10($sp)
; _EN(`get a word from memory')_RU(`загрузить слово из памяти')_ES(`cargar una palabra de la memoria'):
.text:004006E8                 lw      $a1, x
; _EN(`value of x is now in')_RU(`значение x теперь в')_ES(`el valor de x ahora está en') $a1.
.text:004006EC                 la      $t9, printf
.text:004006F0                 lui     $a0, 0x40
.text:004006F4                 jalr    $t9 ; printf
.text:004006F8                 la      $a0, aYouEnteredD___  # "You entered %d...\n"
.text:004006FC                 lw      $ra, 0x20+var_4($sp)
.text:00400700                 move    $v0, $zero
.text:00400704                 lw      $s0, 0x20+var_8($sp)
.text:00400708                 jr      $ra
.text:0040070C                 addiu   $sp, 0x20

...

.data:00410920                 .globl x
.data:00410920 x:              .word 0xA
