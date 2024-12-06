; Machine IR вывод для FMA на физических регистрах
; переписать на x86
bb.0 (%ir-block.3)
    liveins: $edi, $edx, $esi,
    $esi = IMUL32rr $esi $edx implict-def dead $eflags
    $eax = LEA64_32r, $rsi, 1, $rdi, 0, $noreg
    RET64 $eax

; LLVM IR вывод для FMA
define i32 @fma (i32 %0, i32 %1, i32 %2) {
    %4 = mul nsw i32 %2 %1
    %5 = add nsw i32 %4 %0
    ret i32 %5
}

; C/++
int fma (int a, int b, int c) {
    int d = (b * c);
    int e = (d + a);
    return e;
}
; C/++ сжатие
int fma (int a, int b, int c) {
    return a * b + c;
}

; Полагаю можно сделать так:
section .text
    globl fma

fma:
    imul esi, edx
    add esi, edi
    mov eax, esi ; Вернуть значение
    ret ; Выход из операции.

