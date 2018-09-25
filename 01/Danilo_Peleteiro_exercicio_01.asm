%include "asm_io.inc"

segment .data ;variaveis inicializadas

msg1 db "Soma: ", 0
msg2 db "Subtracao: ", 0
msg3 db "Multiplicacao: ", 0
msg4 db "Divisao: ", 0
msg5 db "Resto da divisao: ", 0

segment .bss ;variaveis nao inicializadas

var1 resd 1
var2 resd 1

segment .text ;codigo do programa
        global  _asm_main
        
        
_asm_main:

        ;Inputs

        CALL read_int ; eax = integer from input
        MOV [var1], EAX ; var1 = eax
        CALL read_int ; eax = integer from input
        MOV [var2], EAX ; var2 = eax

        ;First Operation (Add)

        MOV EAX, msg1 ; stores msg1 in eax
        CALL print_string ; prints string stored in eax
        
        MOV EAX, [var1] ; moves content of var1 to eax
        ADD EAX, [var2] ; sum between eax and content of var2, stores value in eax
        CALL print_int ; prints integer stored in eax
        
        CALL print_nl ; prints a new line
        
        ;Second Operation (Sub)

        MOV EAX, msg2 ; stores msg2 in eax
        CALL print_string ; prints string stored in eax

        MOV EAX, [var1] ; moves content of var1 to eax
        SUB EAX, [var2] ; sub between eax and content of var2, stores value in eax
        CALL print_int ; prints integer stored in eax

        CALL print_nl ; prints a new line

        ;Third Operation (Mul)

        MOV EAX, msg3 ; stores msg3 in eax
        CALL print_string ; prints string stored in eax

        MOV EAX, [var1] ; moves content of var1 to eax
        IMUL EAX, [var2] ; imul between eax and content of var2, stores value in eax
        CALL print_int ; prints integer stored in eax

        CALL print_nl ; prints a new line

        ;Fourth Operation (Div)

        MOV EAX, msg4 ; stores msg4 in eax
        CALL print_string ; prints string stored in eax

        MOV EAX, [var1] ; moves content of var1 to eax
        CDQ  ; extending signal to edx
        MOV EBX, [var2] ; moves content of var2 to ebx
        IDIV EBX ; idiv between eax and ebx, stores quotient in eax
        CALL print_int ; prints integer stored in eax

        CALL print_nl ; prints a new line

        ;Fifth Operation (Mod)

        MOV EAX, msg5 ; stores msg4 in eax
        CALL print_string ; prints string stored in eax

        MOV EAX, [var1] ; moves content of var1 to eax
        CDQ ; extending signal to edx
        MOV EBX, [var2] ; moves content of var2 to ebx
        IDIV EBX  ; idiv between eax and ebx, stores quotient in eax and remainder in edx
        MOV EAX, EDX ; eax = edx
        CALL print_int ; prints integer stored in eax

        CALL print_nl ; prints a new line


        leave                     
        ret
        













