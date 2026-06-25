include(`commons.m4')004006a0 <main>:
  4006a0:       3c1c0042        lui     gp,0x42
  4006a4:       27bdffe0        addiu   sp,sp,-32
  4006a8:       279c8930        addiu   gp,gp,-30416
  4006ac:       afbf001c        sw      ra,28(sp)
  4006b0:       afb00018        sw      s0,24(sp)
  4006b4:       afbc0010        sw      gp,16(sp)
  4006b8:       8f998034        lw      t9,-32716(gp)
  4006bc:       3c040040        lui     a0,0x40
  4006c0:       0320f809        jalr    t9
  4006c4:       248408d0        addiu   a0,a0,2256
  4006c8:       8fbc0010        lw      gp,16(sp)
; _EN(`prepare high part of x address')_RU(`подготовить старшую часть адреса x')_ES(`preparar la parte alta de la dirección de x'):
  4006cc:       3c100041        lui     s0,0x41
  4006d0:       8f998038        lw      t9,-32712(gp)
  4006d4:       3c040040        lui     a0,0x40
; _EN(`add low part of x address')_RU(`прибавить младшую часть адреса x')_ES(`añadir la parte baja de la dirección de x'):
  4006d8:       26050920        addiu   a1,s0,2336
; _EN(`now address of x is in')_RU(`теперь адрес x в')_ES(`ahora la dirección de x está en') $a1.
  4006dc:       0320f809        jalr    t9
  4006e0:       248408dc        addiu   a0,a0,2268
  4006e4:       8fbc0010        lw      gp,16(sp)
; _EN(`high part of x address is still in')_RU(`старшая часть адреса x всё еще в')_ES(`la parte alta de la dirección de x todavía está en') $s0. 
; _EN(`add low part to it and load a word from memory')_RU(`прибавить младшую часть к ней и загрузить слово из памяти')_ES(`añadirle la parte baja y cargar una palabra de la memoria'):
  4006e8:       8e050920        lw      a1,2336(s0)
; _EN(`value of x is now in')_RU(`значение x теперь в')_ES(`el valor de x ahora está en') $a1.
  4006ec:       8f99803c        lw      t9,-32708(gp)
  4006f0:       3c040040        lui     a0,0x40
  4006f4:       0320f809        jalr    t9
  4006f8:       248408e0        addiu   a0,a0,2272
  4006fc:       8fbf001c        lw      ra,28(sp)
  400700:       00001021        move    v0,zero
  400704:       8fb00018        lw      s0,24(sp)
  400708:       03e00008        jr      ra
  40070c:       27bd0020        addiu   sp,sp,32
