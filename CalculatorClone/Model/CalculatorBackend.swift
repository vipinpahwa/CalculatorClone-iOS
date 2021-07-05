//
//  CalculatorBackend.swift
//  CalculatorClone
//
//  Created by Vipin Pahwa on 04/07/21.
//

import Foundation

protocol CalculatorBackendDelegate {
    func updateNumberLabel(numberToBeDisplayed: String)
}

struct CalculatorBackend {
    var delegate: CalculatorBackendDelegate?
    var numberDisplayed: Int = 0 {
        didSet {
            delegate?.updateNumberLabel(numberToBeDisplayed: String(numberDisplayed))
        }
    }
    
    var shouldInputNewNumber: Bool = false
    
    mutating func buttonPressed(buttonLabel: String) {
        if let numberPressed = Int(buttonLabel) {
            handleForNumber(numberPressed: numberPressed)
        } else if let binaryOperator = BinaryOperator(rawValue: buttonLabel) {
            handleForBinaryOperator(binaryOperator: binaryOperator)
        } else {
            numberDisplayed = 0
        }
    }
    
    private mutating func handleForNumber(numberPressed: Int) {
        if String(numberDisplayed).count <= 9 {
            if shouldInputNewNumber {
                numberDisplayed = numberPressed
                shouldInputNewNumber = false
            } else {
                numberDisplayed = numberDisplayed * 10 + numberPressed
            }
        }
    }
    
    private mutating func handleForBinaryOperator(binaryOperator: BinaryOperator) {
        shouldInputNewNumber = true
    }
}
