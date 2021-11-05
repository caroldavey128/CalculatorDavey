//
//  CalculatorBrain.swift
//  Calculator - John Davey Ferrer
//
//  Created by John Davey Ferrer on 2021-09-25.
//

import Foundation


func sine(operand: Double) -> Double {
    return sin(operand * Double.pi / 180.0)
}

func cosine(operand: Double) -> Double {
    return cos(operand * Double.pi / 180.0)
}

func tangent(operand: Double) -> Double {
    return tan(operand * Double.pi / 180.0)
}

func percent(operand: Double) -> Double {
    return operand / 100
}

func clearAll(operand: Double) -> Double {
    let operand = 0.0
    return operand
}

func square(operand: Double) -> Double {
    return operand*operand
}

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double,Double) -> Double)
        case equals
    }
   
    private var operations: Dictionary<String, Operation> = [
        "C": Operation.unaryOperation(clearAll),
        "π": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "√": Operation.unaryOperation(sqrt),
        "x²": Operation.unaryOperation(square),
        "sin": Operation.unaryOperation(sine),
        "cos": Operation.unaryOperation(cosine),
        "tan": Operation.unaryOperation(tangent),
        "±": Operation.unaryOperation({ -$0 }),
        "×": Operation.binaryOperation({ $0 * $1} ),
        "÷": Operation.binaryOperation({ $0 / $1} ),
        "+": Operation.binaryOperation({ $0 + $1} ),
        "-": Operation.binaryOperation({ $0 - $1} ),
        "﹪": Operation.unaryOperation(percent),
        "=": Operation.equals
    ]
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                if accumulator != nil {
                accumulator = function(accumulator!)
            }
            case .binaryOperation(let function):
                if accumulator != nil {
                pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                }
            case .equals:
                performPendingBinaryOperation()
        }
    }
    }
    
    private mutating func performPendingBinaryOperation () {
        if pendingBinaryOperation != nil && accumulator != nil {
        accumulator = pendingBinaryOperation!.perform(with: accumulator!)
            pendingBinaryOperation = nil
    }
    }
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let function: (Double,Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    var result: Double? {
        get {
            return accumulator
        }
    }
}
