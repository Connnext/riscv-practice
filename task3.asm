# Программа: заполнение массива из 20 чисел (16+4)
# Остановка: считали 20 или ввели 0
.data
arr: .word 0:20        # массив из 20 элементов

.text
.globl main

main:
    la s0, arr         # s0 = адрес массива
    li s1, 0           # s1 = счётчик
    li s2, 20          # s2 = лимит (16 + 4)
    
input_loop:
    bge s1, s2, done   # если уже 20 - выход
    
    # Читаем число
    li a7, 5
    ecall
    
    beqz a0, done      # если 0 - выход
    
    # Сохраняем в массив
    sw a0, 0(s0)
    addi s0, s0, 4
    addi s1, s1, 1
    j input_loop
    
done:
    li a7, 10
    ecall