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
    var numberToBeDisplayed: Int = 0 {
        didSet {
            delegate?.updateNumberLabel(label: String(numberToBeDisplayed))
        }
    }
    var delegate: CalculatorBackendDelegate?
    
    mutating func buttonPressed(buttonLabel: String) {
        guard buttonLabel.count == 1,
              let numberPressed = Int(buttonLabel),
              String(numberToBeDisplayed).count < 9 else { return }
        numberToBeDisplayed = numberToBeDisplayed * 10 + numberPressed
    }
}
