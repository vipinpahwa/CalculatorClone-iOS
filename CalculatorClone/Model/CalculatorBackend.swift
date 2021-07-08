//
//  CalculatorBackend.swift
//  CalculatorClone
//
//  Created by Vipin Pahwa on 04/07/21.
//

import Foundation

protocol CalculatorBackendDelegate {
    func updateNumberLabel(label: String)
}
struct CalculatorBackend {
    private var numberToBeDisplayed: Int = 0 {
        didSet {
            delegate?.updateNumberLabel(label: String(numberToBeDisplayed))
        }
    }
    var delegate: CalculatorBackendDelegate?
    
    mutating func buttonPressed(buttonLabel: String) {
        if let digit = Int(buttonLabel) {
            handleForDigit(digit: digit)
        } else if buttonLabel == "AC" {
            handleForACOperator()
        } else if buttonLabel == "." {
            handleForPointOperator()
        } else {
            return
        }
    }
    
    private mutating func handleForDigit(digit: Int) {
        guard String(digit).count == 1,
              String(numberToBeDisplayed).count < 9 else { return }
        numberToBeDisplayed = numberToBeDisplayed * 10 + digit
    }
    
    private func handleForPointOperator() {
        delegate?.updateNumberLabel(label: "0.")
        
    }
    
    private mutating func handleForACOperator() {
        numberToBeDisplayed = 0
    }
}
