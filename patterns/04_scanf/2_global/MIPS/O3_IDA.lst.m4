include(`commons.m4').text:004006C0 main:
.text:004006C0
.text:004006C0 var_10          = -0x10
.text:004006C0 var_4           = -4
.text:004006C0
; _EN(`function prologue')_RU(`пролог функции')_ES(`prólogo de la función'):
.text:004006C0                 lui     $gp, 0x42
.text:004006C4                 addiu   $sp, -0x20
.text:004006C8                 li      $gp, 0x418940
.text:004006CC                 sw      $ra, 0x20+var_4($sp)
.text:004006D0                 sw      $gp, 0x20+var_10($sp)
; _EN(`call')_RU(`вызов')_ES(`llamada a') puts():
.text:004006D4                 la      $t9, puts
.text:004006D8                 lui     $a0, 0x40
.text:004006DC                 jalr    $t9 ; puts
.text:004006E0                 la      $a0, aEnterX     # "Enter X:" ; branch delay slot
; _EN(`call')_RU(`вызов')_ES(`llamada a') scanf():
.text:004006E4                 lw      $gp, 0x20+var_10($sp)
.text:004006E8                 lui     $a0, 0x40
.text:004006EC                 la      $t9, __isoc99_scanf
; _EN(`prepare address of')_RU(`подготовить адрес')_ES(`preparar la dirección de') x:
.text:004006F0                 la      $a1, x
.text:004006F4                 jalr    $t9 ; __isoc99_scanf
.text:004006F8                 la      $a0, aD          # "%d"       ; branch delay slot
; _EN(`call')_RU(`вызов')_ES(`llamada a') printf():
.text:004006FC                 lw      $gp, 0x20+var_10($sp)
.text:00400700                 lui     $a0, 0x40
; _EN(`get address of')_RU(`взять адрес')_ES(`obtener la dirección de') x:
.text:00400704                 la      $v0, x
.text:00400708                 la      $t9, printf
; _EN(`load value from "x" variable and pass it to')_RU(`загрузить значение из переменной "x" и передать его в')_ES(`cargar el valor de la variable "x" y pasarlo a') printf() _in $a1:
.text:0040070C                 lw      $a1, (x - 0x41099C)($v0)
.text:00400710                 jalr    $t9 ; printf
.text:00400714                 la      $a0, aYouEnteredD___  # "You entered %d...\n" ; branch delay slot
; _EN(`function epilogue')_RU(`эпилог функции')_ES(`epílogo de la función'):
.text:00400718                 lw      $ra, 0x20+var_4($sp)
.text:0040071C                 move    $v0, $zero
.text:00400720                 jr      $ra
.text:00400724                 addiu   $sp, 0x20  ; branch delay slot

...

.sbss:0041099C  # Segment type: Uninitialized
.sbss:0041099C                 .sbss
.sbss:0041099C                 .globl x
.sbss:0041099C x:              .space 4
.sbss:0041099C
