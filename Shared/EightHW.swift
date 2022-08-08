//
//  EightHW.swift
//  CourseAlgorithms
//
//  Created by Andrey Vensko on 8.08.22.
//

import Foundation

//1. Реализовать сортировку подсчетом.
//2. Реализовать быструю сортировку.
//3. *Реализовать сортировку слиянием.

class EightHW {

    let randomArray = ArrayInt.arrayInt(lenght: 30000, min: 0, max: 10000)

    init() {
        print(randomArray)
        countingSort(inputData: randomArray)
        implementationQuickSort()
        implementationMergeSort()
    }

    //MARK: 1. Реализовать сортировку подсчетом.

    func countingSort(inputData: [Int]) -> [Int] {
        let nowTime = CFAbsoluteTimeGetCurrent()

        guard let maxNumber = inputData.max() else { return inputData }

        var sortArray = inputData

        var arrayNumbers = Array(repeating: 0, count: maxNumber + 1)

        inputData.forEach { arrayNumbers[$0] += 1 }

        var value = 0

        (0...maxNumber).forEach { index in
            (0..<arrayNumbers[index]).forEach { _ in
                sortArray[value] = index
                value += 1
            }
        }

        print("Time countingSort \(CFAbsoluteTimeGetCurrent() - nowTime)")

        return sortArray
    }

    //MARK: 2. Реализовать быструю сортировку.

    func implementationQuickSort() {
        let nowTime = CFAbsoluteTimeGetCurrent()

        quickSort(inputValue: randomArray)

        print("Time quickSort \(CFAbsoluteTimeGetCurrent() - nowTime)")
    }

    func quickSort(inputValue: [Int]) -> [Int] {
        guard inputValue.count > 1 else { return inputValue }


        let center = inputValue[inputValue.count / 2]

        let leftArray = inputValue.filter { $0 < center }
        let centerArray = inputValue.filter { $0 == center }
        let rightArray = inputValue.filter { $0 > center }

        return quickSort(inputValue: leftArray) + centerArray + quickSort(inputValue: rightArray)
    }


    //MARK: 3. *Реализовать сортировку слиянием.

    func implementationMergeSort() {
        let now = CFAbsoluteTimeGetCurrent()

        mergeSort(inputValue: randomArray)

        print("Time mergeSort \(CFAbsoluteTimeGetCurrent() - now)")
    }

    func mergeSort(inputValue: [Int]) -> [Int] {
        guard inputValue.count > 1 else { return inputValue }

        let center = inputValue.count / 2

        let leftArray = Array(inputValue[0..<center])
        let rightArray = Array(inputValue[center...])

        var leftRec = mergeSort(inputValue: leftArray)
        var rightRec = mergeSort(inputValue: rightArray)

        var sortArray = [Int]()

        while leftRec.count > 0 && rightRec.count > 0 {
            guard let leftFirst = leftRec.first,
                  let rightFirst = rightRec.first else { return inputValue }
            if leftFirst < rightFirst {
                sortArray.append(leftRec.removeFirst())
            } else {
                sortArray.append(rightRec.removeFirst())
            }
        }

        return sortArray + leftRec + rightRec
    }

}
