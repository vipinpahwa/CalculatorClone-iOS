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
    let mockDelegate = MockCalculatorBackendDelegate()
    override func setUp() {
        calculatorBackend.delegate = mockDelegate
    }
    
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
    
    func test_buttonPressed_ButtonLabelIsMoreThanOneCharacter_NumberToBeDisplayedShouldBeZero() {
        calculatorBackend.buttonPressed(buttonLabel: "10")
        
        XCTAssertEqual(calculatorBackend.numberToBeDisplayed, 0)
    }
    
    func test_buttonPressed_ButtonLabelsPressedAreOneThenZero_NumberToBeDisplayedShouldBeTen() {
        calculatorBackend.buttonPressed(buttonLabel: "1")
        calculatorBackend.buttonPressed(buttonLabel: "0")
        
        XCTAssertEqual(calculatorBackend.numberToBeDisplayed, 10)
    }
    
    func test_buttonPressed_ButtonLabelsPressedIsZero_UpdateNumberLabelCalledWithZero() {
        calculatorBackend.buttonPressed(buttonLabel: "0")
        
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "0")
    }
}

class MockCalculatorBackendDelegate: CalculatorBackendDelegate {
    var updateNumberLabelCalledWith: String = ""
    func updateNumberLabel(label: String) {
        updateNumberLabelCalledWith = label
    }
}
