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
    private var shouldInputNewNumber: Bool = false
    private var result: Double = 0
    private var currentBinaryOperator: BinaryOperator?
    var delegate: CalculatorBackendDelegate?
    
    mutating func buttonPressed(buttonLabel: String) {
        if Int(buttonLabel) != nil {
            handleForDigit(digitLabel: buttonLabel)
        } else if buttonLabel == "AC" {
            handleForACOperator()
        } else if buttonLabel == "." {
            handleForPointOperator()
        } else if let binaryOperatorPressed = BinaryOperator(rawValue: buttonLabel) {
            shouldInputNewNumber = true
            result = Double(numberToBeDisplayed) ?? 0
            currentBinaryOperator = binaryOperatorPressed
        } else if buttonLabel == "=" {
            guard let currentBinaryOperator = currentBinaryOperator else {
                return
            }
            switch currentBinaryOperator {
            case .add:
                result = result + (Double(numberToBeDisplayed) ?? 0)
            case .subtract:
                result = result - (Double(numberToBeDisplayed) ?? 0)
            case .multiply:
                result = result * (Double(numberToBeDisplayed) ?? 0)
            default:
                break
            }
            let fractionalPart = result - Double(Int(result))
            if fractionalPart == 0 {
                numberToBeDisplayed = String(format: "%.0f", result)
            } else {
                numberToBeDisplayed = String(result)
            }
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
            if shouldInputNewNumber {
                numberToBeDisplayed = digitLabel
                shouldInputNewNumber = false
            } else {
                numberToBeDisplayed = numberToBeDisplayed + digitLabel
            }
        }
    }
    
    private mutating func handleForPointOperator() {
        guard !numberToBeDisplayed.contains(".") else {
            return
        }
        numberToBeDisplayed = numberToBeDisplayed + "."
    }
    
    private mutating func handleForACOperator() {
        numberToBeDisplayed = "0"
    }
}
