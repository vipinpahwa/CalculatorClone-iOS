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
    
    func test_buttonPressed_ButtonLabelsPressedAreTenTimesNine_NumberToBeDisplayedShouldBeNineTimesNine() {
        for _ in 1...10 {
            calculatorBackend.buttonPressed(buttonLabel: "9")
        }
        
        XCTAssertEqual(calculatorBackend.numberToBeDisplayed, 999999999)
    }
    
    func test_buttonPressed_ButtonLabelsPressedAreMoreThanNineDigits_NumberToBeDisplayedShouldBeNineDgits() {
        for _ in 1...10 {
            calculatorBackend.buttonPressed(buttonLabel: "7")
        }
        
        XCTAssertEqual(calculatorBackend.numberToBeDisplayed, 777777777)
    }
    
    func test_buttonPressed_ButtonLabelPressedIsZero_UpdateNumberLabelCalledWithZero() {
        calculatorBackend.buttonPressed(buttonLabel: "0")
        
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "0")
    }
    
    func test_buttonPressed_ButtonLabelPressedIsPlus_UpdateNumberLabelNotCalled() {
        calculatorBackend.buttonPressed(buttonLabel: "+")
        
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "")
    }
    
    func test_buttonPressed_ButtonLabelPressedIsMinus_UpdateNumberLabelNotCalled() {
        calculatorBackend.buttonPressed(buttonLabel: "-")
        
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "")
    }
    
    func test_buttonPressed_ButtonLabelPressedIsDivide_UpdateNumberLabelNotCalled() {
        calculatorBackend.buttonPressed(buttonLabel: "÷")
        
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "")
    }
    
    func test_buttonPressed_ButtonLabelsPressedAreOneThenZero_UpdateNumberLabelBeCalledWithOneThenTen() {
        calculatorBackend.buttonPressed(buttonLabel: "1")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "1")
        
        calculatorBackend.buttonPressed(buttonLabel: "0")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "10")
    }
    
    func test_buttonPressed_ButtonLabelPressedIsAC_UpdateNumberLabelBeCalledWithZero() {
        calculatorBackend.buttonPressed(buttonLabel: "AC")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "0")
    }
}

class MockCalculatorBackendDelegate: CalculatorBackendDelegate {
    var updateNumberLabelCalledWith: String = ""
    func updateNumberLabel(label: String) {
        updateNumberLabelCalledWith = label
    }
}
