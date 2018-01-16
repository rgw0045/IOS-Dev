//: Playground - noun: a place where people can play
//Fibonacci numbers

import UIKit

func Fibonacci(_ limit: Int) {
    var num1 = 0
    var num2 = 1
    for _ in 0...limit {
        let num = num1 + num2
        print("\(num), ")
        
        num1 = num2
        num2 = num
    }
}

Fibonacci(5)
