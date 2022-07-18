//
//  SecondHW.swift
//  CourseAlgorithms
//
//  Created by Andrey Vensko on 18.07.22.
//

//1. Реализовать функцию перевода из десятичной системы в двоичную, используя рекурсию.
//2. Реализовать функцию возведения числа a в степень b:
//a. без рекурсии;
//b. рекурсивно;
//c. *рекурсивно, используя свойство четности степени.
//
//3. Исполнитель Калькулятор преобразует целое число, записанное на экране. У исполнителя две команды, каждой команде присвоен номер:
//Прибавь 1
//Умножь на 2
//Первая команда увеличивает число на экране на 1, вторая увеличивает это число в 2 раза. Сколько существует программ, которые число 3 преобразуют в число 20?
//а) с использованием массива;
//б) с использованием рекурсии.

import Foundation

class SecondHW {
    init() {
        print(firstEx(number: 14))
        print(secondEx(number: 10, degree: 1))
        print(secondExTwo(number: 3, degree: 21))

    }


    //MARK: 1. Реализовать функцию перевода из десятичной системы в двоичную, используя рекурсию.
    func firstEx(number: Int) -> Int {

        if (number / 2) == 0 {
            return number % 2
        }
        return (firstEx(number: number / 2)) * 10 + number % 2
    }

    //MARK: 2. Реализовать функцию возведения числа a в степень b:
    func secondEx(number: Int, degree: Int) -> Int {
        var insideNumber = number
        for _ in 1..<degree {
            insideNumber *= insideNumber
        }
        return insideNumber
    }

    func secondExTwo(number: Int, degree: Int) -> Int {
        if degree == 0 {
            return 1
        }
        return number * secondExTwo(number: number, degree: degree - 1)
    }
}
