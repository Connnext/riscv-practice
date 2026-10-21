# Программа: ввод x, вывод 1 если x == 4, иначе 0
.text
.globl main

main:
    # Считываем число x
    li a7, 5
    ecall
    
    # Проверяем равенство с номером студента
    li t0, 4
    beq a0, t0, equal
    
    # Не равно - выводим 0
    li a0, 0
    j print_result
    
equal:
    # Равно - выводим 1
    li a0, 1
    
print_result:
    li a7, 1
    ecall
    
    # Завершение программы
    li a7, 10
    ecall