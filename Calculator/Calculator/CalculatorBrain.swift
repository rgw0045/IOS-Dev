//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ricky on 4/5/17.
//  Copyright © 2017 Do it BIG Software. All rights reserved.
//

import Foundation

func changeSign(operand: Double) -> Double {
    return -operand
}

func multiply(op1: Double, op2: Double) -> Double {
    return op1 * op2
}

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    private enum operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double,Double) -> Double)
        case equals
    }
    
    private var Operations: Dictionary<String, operation> =
    [
        "π" : operation.constant(Double.pi),
        "e" : operation.constant(M_E),
        "√" : operation.unaryOperation(sqrt),
        "cos" : operation.unaryOperation(cos),
        "±" : operation.unaryOperation(changeSign),
        "×" : operation.binaryOperation(multiply),
        "=" : operation.equals
    ]
    
    mutating func PerformOperation(_ symbol: String){
        if let operation = Operations[symbol] {
            switch operation {
            case .constant(let value) :
                accumulator = value
            case .unaryOperation(let function) :
                if accumulator != nil{
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function) :
                if accumulator != nil {
                    PendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                }
            case .equals :
                PerformPendingBinaryOperation()
            }
        }
    }
    
    private mutating func PerformPendingBinaryOperation() {
        if PendingBinaryOperation != nil && accumulator != nil{
            accumulator = PendingBinaryOperation!.perform(with: accumulator!)
            PendingBinaryOperation = nil
        }
    }
    
    private var PendingBinaryOperation: PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let function: (Double,Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double{
            return function(firstOperand, secondOperand)
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
