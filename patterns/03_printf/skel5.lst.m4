include(`commons.m4')MOV X0, _arg1
MOV X1, _arg2
MOV X2, _arg3
MOV X3, _arg4
MOV X4, _EN(`5th argument')_RU(`5-й аргумент')_ES(`5to argumento')
MOV X5, _EN(`6th argument')_RU(`6-й аргумент')_ES(`6to argumento')
MOV X6, _EN(`7th argument')_RU(`7-й аргумент')_ES(`7mo argumento')
MOV X7, _EN(`8th argument')_RU(`8-й аргумент')_ES(`8vo argumento')
; _EN(``pass 9th, 10th argument, etc, in stack (if needed)'')_RU(``передать 9-й, 10-й аргумент, и~т.д., в стеке (если нужно)'')_ES(``pasar el 9no, 10mo argumento, etc., en la pila (si es necesario)'')
BL CALL _EN(`function')_RU(`функция')_ES(`función')
; _EN(`modify stack pointer (if needed)')_RU(`модифицировать указатель стека (если нужно)')_ES(`modificar el puntero de pila (si es necesario)')
