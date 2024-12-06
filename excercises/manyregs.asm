// попробую переписать функцию с большим колличеством аргументов
// вместо компилятора.

int regs (int a, int b, int c, int d, int e, int f) {
    return a + b + c + d + e + f;
}

section .text
    globl regs
regs:
    ; 