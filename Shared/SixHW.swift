//
//  SixHW.swift
//  CourseAlgorithms
//
//  Created by Andrey Vensko on 1.08.22.
//

import Foundation

class SixHW {
    let arrayValue: [Double] = [3, 7, 34, 54, 79, 200, 210000, 4487897979, 14, 66]

    init() {
        firstEX(arrayValue)
    }

//    1. Реализовать простейшую хеш-функцию. На вход функции подается строка, на выходе сумма кодов символов.
    func firstEX(_ array: [Double]) {

        var defaultDegree: Double = 1

        var trueValue: Double = 0

        for n in array {
            if n != array[0] {
                trueValue += n * pow(5, defaultDegree)
                defaultDegree += 1
            } else {
                trueValue += array[0]
            }
        }

        let twoInDegree = pow(2, Double(array.count))

        let hash = trueValue.truncatingRemainder(dividingBy: twoInDegree)
        print(hash)
    }
}
