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
    
    func test_buttonPressed_ButtonLabelIsZero_NumberToBeDisplayedShouldBeZero() {
        calculatorBackend.buttonPressed(buttonLabel: "0")
        
        XCTAssertEqual(calculatorBackend.numberToBeDisplayed, 0)
    }
    
    func test_buttonPressed_ButtonLabelIsOne_NumberToBeDisplayedShouldBeOne() {
        calculatorBackend.buttonPressed(buttonLabel: "1")
        
        XCTAssertEqual(calculatorBackend.numberToBeDisplayed, 1)
    }
    
    func test_buttonPressed_ButtonLabelIsPlus_NumberToBeDisplayedShouldBeZero() {
        calculatorBackend.buttonPressed(buttonLabel: "+")
        
        XCTAssertEqual(calculatorBackend.numberToBeDisplayed, 0)
    }
}
