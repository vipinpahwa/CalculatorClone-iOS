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
    
    mutating func buttonPressed(buttonLabel: String) {
        if String(numberDisplayed).count <= 9,
           let numberPressed = Int(buttonLabel) {
            numberDisplayed = numberDisplayed * 10 + numberPressed
        }
    }
}
