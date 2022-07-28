//
//  Stack.swift
//  CourseAlgorithms
//
//  Created by Andrey Vensko on 27.07.22.
//

import Foundation

struct Stack<T> {
    private var items: [T] = []

    mutating func push(element: T) {
        print("add \(element)")
        items.append(element)
    }

    mutating func pop() -> T? {
        if !items.isEmpty {
            return items.removeLast()
        }
        return nil
    }

    mutating func peek() -> [T] {
        return items
    }

    func checkLast() -> T? {
        items.last
    }

    mutating func empty() {
        items.removeAll()
    }
}
