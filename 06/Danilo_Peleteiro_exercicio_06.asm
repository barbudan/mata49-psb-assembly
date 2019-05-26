segment .data ;variaveis inicializadas

segment .bss ;variaveis nao inicializadas
vet1 resb 3
vet2 resb 3
newline resb 1
real_newline resb 1
result3 resb 3
result3Len: equ $-result3
result4 resb 4
result4Len: equ $-result4


segment .text ;codigo do programa
        global  _start

_start:
  
  ;insere quebra de linha na variavel
  mov eax, 10
  mov [real_newline], eax

  ;le o vetor 1
  mov eax, 3
  mov ebx, 0
  mov ecx, vet1
  mov edx, 3
  int 80h

  ;desconsidera a quebra de linha armazenada no buffer
  mov eax, 3
  mov ebx, 0
  mov ecx, newline
  mov edx, 1
  int 80h

  ;le o vetor 2
  mov eax, 3
  mov ebx, 0
  mov ecx, vet2
  mov edx, 3
  int 80h

  mov eax, 0
  mov ebx, 0
  mov ecx, 0
  mov edx, 0

  ;transforma vet1 em inteiro
  mov al, [vet1]
  sub al, '0'
  mov bl, [vet1+1]
  sub bl, '0'
  mov cl, [vet1+2]
  sub cl, '0'

  movzx eax, al
  imul eax, 100
  movzx ebx, bl
  imul ebx, 10

  movzx ecx, cl

  add eax, ebx
  add eax, ecx

  mov edx, eax ; armazena valor de vet1 em edx

  ;transforma vet2 em inteiro
  mov al, [vet2]
  sub al, '0'
  mov bl, [vet2+1]
  sub bl, '0'
  mov cl, [vet2+2]
  sub cl, '0'

  movzx eax, al
  imul eax, 100
  movzx ebx, bl
  imul ebx, 10

  add eax, ebx
  add eax, ecx

  add eax, edx ; eax = vet1+vet2

  cmp eax, 999
  jle tem_3_digitos

  tem_4_digitos:

    mov ebx, eax
    cdq
    mov ecx, 1000
    idiv ecx

    add eax, '0'
    mov [result4], al

    mov eax, edx
    cdq
    mov ecx, 100
    idiv ecx

    add eax, '0'
    mov [result4+1], al

    mov eax, edx
    cdq
    mov ecx, 10
    idiv ecx

    add eax, '0'
    mov [result4+2], al

    mov eax, edx
    add al, '0'
    mov [result4+3], al

    mov eax, 4
    mov ebx, 1
    mov ecx, result4
    mov edx, result4Len
    int 80h

    ;quebra de linha
    mov eax, 4
    mov ebx, 1
    mov ecx, real_newline
    mov edx, 1
    int 80h


    jmp fim

  tem_3_digitos:

    mov ebx, eax
    cdq
    mov ecx, 100
    idiv ecx

    add eax, '0'
    mov [result3], al

    mov eax, edx
    cdq
    mov ecx, 10
    idiv ecx

    add eax, '0'
    mov [result3+1], al

    mov eax, edx
    add al, '0'
    mov [result3+2], al

    mov eax, 4
    mov ebx, 1
    mov ecx, result3
    mov edx, result3Len
    int 80h

    ;quebra de linha
    mov eax, 4
    mov ebx, 1
    mov ecx, real_newline
    mov edx, 1
    int 80h


  fim:

    mov eax, 1
    mov ebx, 0
    int 80h