; Приблизительно схема работы функции possibleSum
; Теперь это надо переписать на высокоуровневом языке
possible_sum(int):
    mov eax, 1
    cmp edi, 1
    je .L1
    lea eax, [rdi-1]
    lea ecx, [rdi-2]
    imul eax, ecx
    lea edx, [rdi-3]
    shr rdx,
    add eax, edi
    sub eax, edx
    inc eax
.L1:
    ret