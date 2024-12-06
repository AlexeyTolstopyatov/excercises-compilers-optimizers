// 1) Перезапись всех инструкций

// Предположим, я не знаю функция вообще
// имеет тип возвращаемый или нет.
// оставлю void
//
// Если функция что-то возвращает, то ее результат выполнения (возможно адресом)
// передается в регистр (по-моему не сегментный)
//
// Если результат передается, тогда это не void тип данных функции,
// а int32
int possible_sum3(int n) {
    long rdi = n; // Destanation index указывает на следующий аргумент

    // Есть возможность, что если rdi = 1, то 1 - 1 (инструкцией ниже)
    // вызовет вопрос деления на ноль. Поэтому здесь есть метка .L1
    if (rdi == 1)
        return 1;

    int eax = (rdi - 1);
    int ecx = (rdi - 2);
    eax *= ecx;
    int edx = (rdi - 3);
    // shr rdx очень похоже на деление на 2 (Floor)
    // поэтому смею выдать идею, что:
    int rdx = (long)eax / 2;
    eax += rdi;
    eax -= edx;
    ++eax;

    return eax;
}


// 2) Компановка всех инструкций.
int possible_sum3(int n) {
    return (((rdi-1) * (rdi-2) + rdi) - (rdi - 3) / 2) + 1;
}