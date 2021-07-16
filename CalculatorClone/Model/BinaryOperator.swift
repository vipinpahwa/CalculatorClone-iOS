//
//  BinaryOperator.swift
//  CalculatorClone
//
//  Created by Vipin Pahwa on 10/07/21.
//

import Foundation

enum BinaryOperator: String {
     case add = "+"
     case subtract = "-"
     case multiply = "x"
     case divide = "÷"
    
    func performOperation(firstOperand: Double, secondOperand: Double) -> Double {
        let result: Double
        switch self {
        case .add:
            result = firstOperand + secondOperand
        case .subtract:
            result = firstOperand - secondOperand
        case .multiply:
            result = firstOperand * secondOperand
        case .divide:
            result = firstOperand / secondOperand
        }
        return result
    }
}
