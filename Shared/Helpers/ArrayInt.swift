//
//  ArrayInt.swift
//  CourseAlgorithms
//
//  Created by Andrey Vensko on 23.07.22.
//

import Foundation

struct ArrayInt {
    static func arrayInt(lenght: Int, min valueMin: Int, max valueMax: Int ) -> [Int] {
        var arrayInt = [Int]()

        for _ in 0..<lenght {
            arrayInt.append(Int.random(in: valueMin...valueMax))
        }
        return arrayInt
    }
}
