//
//  ThirdHW.swift
//  CourseAlgorithms
//
//  Created by Andrey Vensko on 23.07.22.
//

//1. Попробовать оптимизировать пузырьковую сортировку. Сравнить количество операций сравнения оптимизированной и не оптимизированной программы. Написать функции сортировки, которые возвращают количество операций.
//2. *Реализовать шейкерную сортировку.
//3. Реализовать бинарный алгоритм поиска в виде функции, которой передается отсортированный массив. Функция возвращает индекс найденного элемента или -1, если элемент не найден.
//4. *Подсчитать количество операций для каждой из сортировок и сравнить его с асимптотической сложностью алгоритма.

import Foundation

class ThirdHW {
    let notSortArray = ArrayInt.arrayInt(lenght: 100, min: 0, max: 100)
    
    init() {
        //        firstExBubble(notSortArray)
        //        firstMod(notSortArray)
//        secondExShaker(notSortArray)
        //        thirdEx(search: 1, notSortArray)
    }
    
    //1. Попробовать оптимизировать пузырьковую сортировку. Сравнить количество операций сравнения оптимизированной и не оптимизированной программы. Написать функции сортировки, которые возвращают количество операций.
    func firstExBubble(_ notSortArray: [Int]) {
        var array = notSortArray
        var numbes = 0
        print(array)
        
        for _ in 0..<array.count {
            for j in 0..<(array.count - 1) {
                if array[j] > array[j + 1] {
                    array.swapAt(j, j + 1)
                }
                numbes += 1
            }
            numbes += 1
        }
        
        print(array)
        print(numbes)
    }
    
    func firstMod(_ notSortArray: [Int]) {
        var array = notSortArray
        var numbes = 0
        var boolValue = true
        print(array)
        
        while(boolValue) {
            boolValue = false
            for j in 0..<(array.count - 1) {
                if array[j] > array[j + 1] {
                    array.swapAt(j, j + 1)
                    boolValue = true
                }
                numbes += 1
            }
            numbes += 1
        }
        
        print(array)
        print(numbes)
    }
    
    //2. *Реализовать шейкерную сортировку.
    static func secondExShaker(_ notSortArray: [Int]) -> [Int] {
        var array = notSortArray
        var numbers = 0
        var min = 0
        var max = array.count - 1

        while(min <= max) {
            for index in stride(from: max, to: min, by: -1) {
                if array[index - 1] > array[index] {
                    array.swapAt(index, index - 1)
                }
                numbers += 1
            }
            
            min += 1

            if min < max {
                for index in min..<max {
                    if array[index] > array[index + 1] {
                        array.swapAt(index, index + 1)
                    }
                    numbers += 1
                }
            }
            max -= 1
            numbers += 1
        }

        return array
    }
    
    //3. Реализовать бинарный алгоритм поиска в виде функции, которой передается отсортированный массив. Функция возвращает индекс найденного элемента или -1, если элемент не найден.
    static func thirdEx(search value: Int, _ notSortArray: [Int]) -> Bool {
        let array = secondExShaker(notSortArray)
        
        var left = 0
        var right = array.count - 1
        var middle = left + (right - left) / 2
        
        while(left <= right) {
            if array[middle] < value {
                left = middle + 1
            } else {
                right = middle - 1
            }
            middle = left + (right - left) / 2
        }

        guard middle < array.count else { return true }
        
        if array[middle] == value {
            return false
        } else {
            return true
        }
    }
}
