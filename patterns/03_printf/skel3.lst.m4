include(`commons.m4')MOV RDI, _arg1
MOV RSI, _arg2
MOV RDX, _arg3
MOV RCX, _arg4
MOV R8, _EN(`5th argument')_RU(`5-й аргумент')_ES(`5to argumento')
MOV R9, _EN(`6th argument')_RU(`6-й аргумент')_ES(`6to argumento')
...
PUSH _EN(``7th, 8th argument, etc (if needed)'')_RU(``7-й, 8-й аргумент, и~т.д. (если нужно)'')_ES(``7mo, 8vo argumento, etc. (si es necesario)'')
CALL _EN(`function')_RU(`функция')_ES(`función')
; _EN(`modify stack pointer (if needed)')_RU(`модифицировать указатель стека (если нужно)')_ES(`modificar el puntero de pila (si es necesario)')

