//
//  NumberButton.swift
//  CalculatorClone
//
//  Created by Vipin Pahwa on 29/06/21.
//

import Foundation
import UIKit

class NumberButton: UIButton {
    var number: Int = 0 {
        didSet {
            self.setTitle("\(number)", for: .normal)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = .init(red: 80/255, green: 80/255, blue: 80/255, alpha: 1)
        self.setTitleColor(.white, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
