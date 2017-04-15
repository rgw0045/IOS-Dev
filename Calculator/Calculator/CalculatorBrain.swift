//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ricky on 4/5/17.
//  Copyright © 2017 Do it BIG Software. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    private enum operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
    }
    
    private var Operations: Dictionary<String, operation> =
    [
        "π" : operation.constant(Double.pi),
        "e" : operation.constant(M_E),
        "√" : operation.unaryOperation(sqrt),
        "cos" : operation.unaryOperation(cos)
    ]
    
    mutating func PerformOperation(_ symbol: String){
        //because it may not be in the table to it will be an optional
        if let operation = Operations[symbol] {
            switch operation {
            case .constant(let value) :
                accumulator = value
            case .unaryOperation :
                break
            }
        }
    }
    
    mutating func SetOperand(_ operand: Double){
        accumulator = operand
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
}
