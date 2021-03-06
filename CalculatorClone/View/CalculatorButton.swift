//
//  NumberButton.swift
//  CalculatorClone
//
//  Created by Vipin Pahwa on 29/06/21.
//

import Foundation
import UIKit

class CalculatorButton: UIButton {
    var label: String = "0" {
        didSet {
            self.setTitle(label, for: .normal)
            if Int(label) != nil {
                setupForNumber()
            } else if isBinaryOperator() {
                setupForBinaryOperator()
            } else {
                setupForACButton()
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupForNumber()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func isBinaryOperator() -> Bool {
        return (label == "+" || label == "-" || label == "x" || label == "\\")
    }
    
    private func setupForNumber() {
        self.backgroundColor = .init(red: 80/255, green: 80/255, blue: 80/255, alpha: 1)
        self.setTitleColor(.white, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupForACButton() {
        self.backgroundColor = .lightGray
        self.setTitleColor(.black, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupForBinaryOperator() {
        self.backgroundColor = .init(red: 255/255, green: 149/255, blue: 0, alpha: 1)
        self.setTitleColor(.white, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
