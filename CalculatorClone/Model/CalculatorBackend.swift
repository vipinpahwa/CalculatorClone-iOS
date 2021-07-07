//
//  CalculatorBackend.swift
//  CalculatorClone
//
//  Created by Vipin Pahwa on 04/07/21.
//

import Foundation

struct CalculatorBackend {
    var numberToBeDisplayed: Int = 0
    
    mutating func buttonPressed(buttonLabel: String) {
        guard buttonLabel.count == 1,
              let numberPressed = Int(buttonLabel) else { return }
        numberToBeDisplayed = numberToBeDisplayed * 10 + numberPressed
    }
}
