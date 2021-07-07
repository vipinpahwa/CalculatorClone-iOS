//
//  CalculatorCloneTests.swift
//  CalculatorCloneTests
//
//  Created by Vipin Pahwa on 07/07/21.
//

import XCTest
@testable import CalculatorClone

class CalculatorBackendTests: XCTestCase {
    var calculatorBackend = CalculatorBackend()
    
    func test_buttonPressed_ButtonLabelIsZero_NumberToBeDisplayedShouldBeZro() {
        calculatorBackend.buttonPressed(buttonLabel: "0")
        
        XCTAssertEqual(calculatorBackend.numberToBeDisplayed, 0)
    }
}
