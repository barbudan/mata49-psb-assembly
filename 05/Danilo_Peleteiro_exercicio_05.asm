%include "asm_io.inc"

segment .data ;variaveis inicializadas

segment .bss ;variaveis nao inicializadas
var1 resd 1

segment .text ;codigo do programa
        global  asm_main

asm_main:

  mov ebx, 0
  mov ecx, 30

  lp:
    call read_char

    mov edx, ecx
    mov ecx, ebx

    cmp al, ' '
    je espaco
    cmp al, '.'
    je fim_loop

    movzx eax, al
    push eax
    inc ebx

    jmp fim_volta

    espaco:
      pop eax
      call print_char

    loop espaco

    mov al, ' '
    call print_char
    mov ebx, 0
    jmp fim_volta

    fim_loop:
      last_loop:
        pop eax
        call print_char
      loop last_loop

      jmp end

    fim_volta:
      mov ecx, edx

  loop lp

  end:

  call print_nl
  leave
  ret
