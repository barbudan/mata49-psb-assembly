%include "asm_io.inc"

segment .data ;variaveis inicializadas

segment .bss ;variaveis nao inicializadas

segment .text ;codigo do programa
        global  _asm_main
        
        
_asm_main:
        
        MOV ECX, 8
        MOV BL, 0

        l1:

                SAL BL, 1

                CALL read_char
                
                SUB AL, '0'
                OR BL, AL
                   
                LOOP l1

        MOV AL, BL
        CALL print_int
        CALL print_nl
                
        leave                     
        ret