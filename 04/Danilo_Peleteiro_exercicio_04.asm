%include "asm_io.inc"

segment .data ;variaveis inicializadas

espaco1 db " ", 0

segment .bss ;variaveis nao inicializadas

vec1 resd 10
vec2 resd 10
aux1 resd 1
aux2 resd 1

segment .text ;codigo do programa
        global  _asm_main
        
        
_asm_main:
	
		mov ebx, 0
		mov ecx, 10
		
		leitura1:
		
			call read_int
			mov [vec1+ebx], eax
			add ebx, 4
			
		loop leitura1

		mov ebx, 0
		mov ecx,10

		leitura2:

			call read_int
			mov [vec2+ebx], eax
			add ebx, 4
			
		loop leitura2

		mov ebx, 0
		mov ecx,10

		analise1:

			mov eax, [vec1+ebx]
			
			mov [aux1], ecx
			mov edx, 0
			mov ecx, 10

			analise2:

				mov [aux2], eax
				cmp eax, [vec2+edx] 
				je iguais

				jmp fim_loop

				iguais:

					call print_int
					mov eax, espaco1
					call print_string

				fim_loop:

				add edx, 4
				mov eax, [aux2]

			loop analise2


			mov ecx, [aux1]
			add ebx, 4

		loop analise1

		call print_nl

        leave                     
        ret