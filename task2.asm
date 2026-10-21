# Программа: вывод диапазона min(x,118)...max(x,118) с шагом 4
.text
.globl main

.data
nl: .asciiz "\n"

main:
    # Вводим x
    li a7, 5
    ecall
    mv s0, a0          # s0 = x
    
    li s1, 118         # s1 = y (номер группы)
    li s2, 4           # s2 = h (шаг = номер студента)
    
    # Определяем min и max
    blt s0, s1, x_smaller
    mv t0, s1          # min = 118
    mv t1, s0          # max = x
    j iterate
    
x_smaller:
    mv t0, s0          # min = x
    mv t1, s1          # max = 118
    
iterate:
    bgt t0, t1, exit   # если вышли за max - конец
    
    # Печатаем текущее значение
    mv a0, t0
    li a7, 1
    ecall
    
    # Печатаем перенос строки
    la a0, nl
    li a7, 4
    ecall
    
    add t0, t0, s2     # увеличиваем на шаг
    j iterate
    
exit:
    li a7, 10
    ecall