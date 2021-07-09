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
    private var numberToBeDisplayed: String = "0" {
        didSet {
            delegate?.updateNumberLabel(label: numberToBeDisplayed)
        }
    }
    var delegate: CalculatorBackendDelegate?
    
    mutating func buttonPressed(buttonLabel: String) {
        if Int(buttonLabel) != nil {
            handleForDigit(digitLabel: buttonLabel)
        } else if buttonLabel == "AC" {
            handleForACOperator()
        } else if buttonLabel == "." {
            handleForPointOperator()
        } else {
            return
        }
    }
    
    private mutating func handleForDigit(digitLabel: String) {
        guard digitLabel.count == 1,
              String(numberToBeDisplayed).count < 9 else { return }
        if numberToBeDisplayed == "0" {
            numberToBeDisplayed = digitLabel
        } else {
            numberToBeDisplayed = numberToBeDisplayed + digitLabel
        }
    }
    
    private mutating func handleForPointOperator() {
        numberToBeDisplayed = numberToBeDisplayed + "."
    }
    
    private mutating func handleForACOperator() {
        numberToBeDisplayed = "0"
    }
}
