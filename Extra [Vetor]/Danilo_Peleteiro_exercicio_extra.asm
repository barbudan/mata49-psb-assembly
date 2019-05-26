%include "asm_io.inc"

segment .data ;variaveis inicializadas

msg1 db "Entrou menor_igual", 0
msg2 db "Entrou maior", 0
        
segment .bss ;variaveis nao inicializadas

var1 resb 10
var2 resb 1

segment .text ;codigo do programa
        global  _asm_main
                
        
_asm_main:

        mov edi, var1
        cld

        mov eax, 0
        mov ebx, 0
                
        call read_int
        mov [var2], al
        call read_char ; tive que realizar essa leitura extra por conta do 'enter' dado, para contabilizar a quebra de linha adequadamente nessa leitura
        
        mov ecx, 10

        lp:
                mov bl, [var2]
                mov edx, 0
                call read_char
                add dl, bl
                add dl, al

                cmp dl, 'Z'
                jg maior_90

                menor_igual_90:
                        mov al, dl
                        jmp fim_loop

                maior_90:
                        mov dl, 'Z' ; dl = 'Z'
                        sub dl, al ; dl = dl
                        sub bl, dl 
                        mov al, '@'
                        add al, bl
                        
                fim_loop:
                        stosb

        loop lp

        mov edi, var1
        mov esi, edi

        mov ecx, 10

        lp2:
                lodsb
                call print_char

        loop lp2

        call print_nl

        leave                     
        ret