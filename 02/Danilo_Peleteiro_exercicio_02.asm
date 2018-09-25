%include "asm_io.inc"

segment .data ;variaveis inicializadas

msg1 db "Primo", 0
msg2 db "Não é primo", 0

segment .bss ;variaveis nao inicializadas

segment .text ;codigo do programa
        global  _asm_main
        
        
_asm_main:

        input:
               
                CALL read_int ; eax = integer from input
                
                MOV ECX, EAX ; ecx = eax
                MOV EBX, EAX ; ebx = eax

                CMP ECX, 2 ; compares if ecx equals 2
                JE primo ; if ecx == 2, jumps to 'primo'
                CMP ECX, 1 ; compares if ecx equals 1
                JLE nao_primo ; if ecx <= 1, jumps to 'nao_primo'

                DEC ECX ; ecx--

        l1:
             
                CMP ECX, 1 ; compares if ecx equals 1
                JLE primo ; if ecx <= 1, jumps to 'primo'               
                
                CDQ ; sign extend from eax to edx.
                IDIV ECX ; edx:eax = eax/ecx

                CMP EDX, 0 ; compares if edx equals 0
                JZ nao_primo ; if edx==0, jumps to 'nao_primo'

                MOV EAX, EBX ; eax = ebx

                loop l1 ; ecx-- and goes to 'l1' (until ecx!=0)


        primo:
        
                MOV EAX, msg1 ; eax = msg1
                CALL print_string ; prints string in eax
                CALL print_nl ; prints a new line
                JMP fim ; jumps to 'fim'

        nao_primo:
                
                MOV EAX, msg2 ; eax = msg2
                CALL print_string ; prints string in eax
                CALL print_nl ; prints a new line

        fim:

        leave                     
        ret