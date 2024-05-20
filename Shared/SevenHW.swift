//
//  SevenHW.swift
//  CourseAlgorithms
//
//  Created by Andrey Vensko on 7.08.22.
//

import Foundation

class SevenHW {

    let arrayPoint: [[Int]] = [[1, 1],
                               [1, 2],
                               [2, 1],
                               [2, 3],
                               [2, 5],
                               [3, 2],
                               [3, 4],
                               [4, 3],
                               [4, 5],
                               [5, 6],
                               [5, 7],
                               [6, 5],
                               [7, 5]]

    init() {
        adjacentMatrix(arrayPoint: arrayPoint)
    }

    //    1. Написать функции, которые считывают матрицу смежности из файла и выводят ее на экран.
    func adjacentMatrix(arrayPoint: [[Int]]) {
        var arrayMatrix: [(Int, [Int])] = [(0, [Int]())]

        arrayPoint.forEach {
            if ThirdHW.thirdEx(search: $0[0], arrayMatrix[0].1) {
                arrayMatrix[0].1.append($0[0])
                arrayMatrix.append(($0[0], [0]))
            }

            if ThirdHW.thirdEx(search: $0[1], arrayMatrix[0].1) {
                arrayMatrix[0].1.append($0[1])
                arrayMatrix.append(($0[1], [0]))
            }
        }

        (1...arrayMatrix[0].1.count).forEach {
            arrayMatrix[$0].1 = (0..<arrayMatrix[0].1.count).map { _ in 0 }
        }

        arrayPoint.forEach {
            let firstIndex = foundIndex(search: $0[0], arrayMatrix[0].1)
            let secondIndex = foundIndex(search: $0[1], arrayMatrix[0].1)

            arrayMatrix[firstIndex + 1].1[secondIndex] = Int.random(in: 0...10)
        }

        arrayMatrix.forEach { print($0) }
    }

    func foundIndex(search value: Int, _ notSortArray: [Int]) -> Int {
        let array = ThirdHW.secondExShaker(notSortArray)

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

        guard middle < array.count else { return 0 }

        if array[middle] == value {
            return middle
        } else {
            return 0
        }
    }

}

