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
    var numberToBeDisplayed: Int = 0
    var delegate: CalculatorBackendDelegate?
    
    mutating func buttonPressed(buttonLabel: String) {
        if buttonLabel != "+" {
            delegate?.updateNumberLabel(label: buttonLabel)
        }
        guard buttonLabel.count == 1,
              let numberPressed = Int(buttonLabel) else { return }
        numberToBeDisplayed = numberToBeDisplayed * 10 + numberPressed
    }
}
