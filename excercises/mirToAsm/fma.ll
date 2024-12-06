; LLVM IR вывод для FMA
define i32 @fma (i32 %0, i32 %1, i32 %2) {
    %4 = mul nsw i32 %2 %1
    %5 = add nsw i32 %4 %0
    ret i32 %5
}
