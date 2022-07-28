//
//  FifthHW.swift
//  CourseAlgorithms
//
//  Created by Andrey Vensko on 27.07.22.
//

import Foundation

class FifthHW {
    init() {
        firstEX(17889078)
        thirtEx("[2/{5*(4+7)}]")
    }

    //1. Реализовать перевод из десятичной в двоичную систему счисления с использованием стека.
    func firstEX(_ value: Int) {
        var stack = Stack<Int>()
        var tenValue = value
        var line = String()

        while tenValue >= 1 {
            let twoValue = tenValue % 2
            tenValue /= 2
            stack.push(element: twoValue)
        }

        for _ in 0...(stack.peek().count - 1) {
            guard let pop = stack.pop() else { return }
            line.append("\(pop)")
        }
        print(line)
    }

    //3. Написать программу, которая определяет, является ли введенная скобочная последовательность правильной. Примеры правильных скобочных выражений: (), ([])(), {}(), ([{}]), неправильных — )(, ())({), (, ])}), ([(]) для скобок [,(,{.
    //Например: (2+(2*2)) или [2/{5*(4+7)}]
    func thirtEx(_ line: String) {
        var stack = Stack<String.Element>()

        for index in line {
            if index == "(" ||
                index == "{" ||
                index == "[" {
                stack.push(element: index)
            } else if index == "(" ||
                        index == "{" ||
                        index == "[" {
                switch index {
                case ")":
                    guard stack.checkLast() == "(" else {
                        print("Error not (")
                        return
                    }
                    print(stack.pop())
                case "}":
                    guard stack.checkLast() == "{" else {
                        print("Error not {")
                        return
                    }
                    print(stack.pop())
                case "]":
                    guard stack.checkLast() == "[" else {
                        print("Error not [")
                        return
                    }
                    print(stack.pop())
                default: print()
                }
            }
        }
    }
}
