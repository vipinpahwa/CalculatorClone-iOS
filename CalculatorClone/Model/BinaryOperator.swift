//
//  BinaryOperator.swift
//  CalculatorClone
//
//  Created by Vipin Pahwa on 04/07/21.
//

import Foundation

enum BinaryOperator: String {
    case add = "+"
    case subtract = "-"
    case multiply = "x"
    case divide = "÷"
    
    func performOperation(firstOperand: Int, secondOperand: Int) -> Int {
        switch self {
        case .add:
            return firstOperand + secondOperand
        case .subtract:
            return firstOperand - secondOperand
        case .multiply:
            return firstOperand * secondOperand
        case .divide:
            return firstOperand / secondOperand
        }
    }
}
