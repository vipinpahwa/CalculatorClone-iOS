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
    
    func test_buttonPressed_ButtonLabelPressedIsZero_UpdateNumberLabelCalledWithZero() {
        calculatorBackend.buttonPressed(buttonLabel: "0")
        
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "0")
    }
    
    func test_buttonPressed_ButtonLabelIsOne_UpdateNumberLabelCalledWithOne() {
        calculatorBackend.buttonPressed(buttonLabel: "1")
        
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "1")
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
    
    func test_buttonPressed_ButtonLabelIsMoreThanOneCharacter_UpdateNumberLabelNotCalled() {
        calculatorBackend.buttonPressed(buttonLabel: "10")
        
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "")
    }
    
    func test_buttonPressed_ButtonLabelsPressedAreOneThenZero_UpdateNumberLabelBeCalledWithOneThenTen() {
        calculatorBackend.buttonPressed(buttonLabel: "1")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "1")
        
        calculatorBackend.buttonPressed(buttonLabel: "0")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "10")
    }
    
    func test_buttonPressed_ButtonLabelsPressedAreTenTimesNine_UpdateNumberLabelBeCalledWithNineTimesNine() {
        for _ in 1...10 {
            calculatorBackend.buttonPressed(buttonLabel: "9")
        }
        
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "999999999")
    }
    
    func test_buttonPressed_ButtonLabelsPressedAreMoreThanNineDigits_NumberToBeDisplayedShouldBeNineDgits() {
        for _ in 1...10 {
            calculatorBackend.buttonPressed(buttonLabel: "7")
        }
        
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "777777777")
    }
    
    func test_buttonPressed_ButtonLabelPressedIsAC_UpdateNumberLabelBeCalledWithZero() {
        calculatorBackend.buttonPressed(buttonLabel: "AC")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "0")
    }
    
    func test_buttonPressed_ButtonLabelPressedIsPoint_UpdateNumberLabelBeCalledWithPointAfterZero() {
        calculatorBackend.buttonPressed(buttonLabel: ".")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "0.")
    }
    
    func test_buttonPressed_ButtonLabelPressedAreOneThenPoint_UpdateNumberLabelBeCalledWithPointAfterOne() {
        calculatorBackend.buttonPressed(buttonLabel: "1")
        calculatorBackend.buttonPressed(buttonLabel: ".")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "1.")
    }
    
    func test_buttonPressed_ButtonLabelPressedAreZeroPointOne_UpdateNumberLabelBeCalledWithZeroPointOne() {
        calculatorBackend.buttonPressed(buttonLabel: "0")
        calculatorBackend.buttonPressed(buttonLabel: ".")
        calculatorBackend.buttonPressed(buttonLabel: "1")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "0.1")
    }
    
    func test_buttonPressed_ButtonLabelPressedIsPointAfterZeroPointOne_UpdateNumberLabelNotCalled() {
        calculatorBackend.buttonPressed(buttonLabel: "0")
        calculatorBackend.buttonPressed(buttonLabel: ".")
        calculatorBackend.buttonPressed(buttonLabel: "1")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "0.1")
        calculatorBackend.buttonPressed(buttonLabel: ".")
        XCTAssertNotEqual(mockDelegate.updateNumberLabelCalledWith, ".")
    }
    
    func test_buttonPressed_ButtonLabelsPressedAreTwoPlusFive_UpdateNumberLabelCalledWithFive() {
        calculatorBackend.buttonPressed(buttonLabel: "2")
        calculatorBackend.buttonPressed(buttonLabel: "+")
        calculatorBackend.buttonPressed(buttonLabel: "5")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "5")
    }
    
    func test_buttonPressed_ButtonLabelsPressedAreTwoMinusFive_UpdateNumberLabelCalledWithFive() {
        calculatorBackend.buttonPressed(buttonLabel: "2")
        calculatorBackend.buttonPressed(buttonLabel: "-")
        calculatorBackend.buttonPressed(buttonLabel: "5")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "5")
    }
    
    func test_buttonPressed_ButtonLabelsPressedAreTwoMultiplyFive_UpdateNumberLabelCalledWithFive() {
        calculatorBackend.buttonPressed(buttonLabel: "2")
        calculatorBackend.buttonPressed(buttonLabel: "x")
        calculatorBackend.buttonPressed(buttonLabel: "5")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "5")
    }
    
    func test_buttonPressed_ButtonLabelsPressedAreTwoDivideFive_UpdateNumberLabelCalledWithFive() {
        calculatorBackend.buttonPressed(buttonLabel: "2")
        calculatorBackend.buttonPressed(buttonLabel: "÷")
        calculatorBackend.buttonPressed(buttonLabel: "5")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "5")
    }
    
    func test_buttonPressed_ButtonLabelsPressedAreTwoPlusFiveThenEqual_UpdateNumberLabelCalledWithSeven() {
        calculatorBackend.buttonPressed(buttonLabel: "2")
        calculatorBackend.buttonPressed(buttonLabel: "+")
        calculatorBackend.buttonPressed(buttonLabel: "5")
        calculatorBackend.buttonPressed(buttonLabel: "=")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "7")
    }
    
    func test_buttonPressed_ButtonLabelsPressedAreThreePlusFiveThenEqual_UpdateNumberLabelCalledWithEight() {
        calculatorBackend.buttonPressed(buttonLabel: "3")
        calculatorBackend.buttonPressed(buttonLabel: "+")
        calculatorBackend.buttonPressed(buttonLabel: "5")
        calculatorBackend.buttonPressed(buttonLabel: "=")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "8")
    }
    
    func test_buttonPressed_ButtonLabelsPressedAreThreePlusZeroPointOneThenEqual_UpdateNumberLabelCalledWithThreePointOne() {
        calculatorBackend.buttonPressed(buttonLabel: "3")
        calculatorBackend.buttonPressed(buttonLabel: "+")
        calculatorBackend.buttonPressed(buttonLabel: "0")
        calculatorBackend.buttonPressed(buttonLabel: ".")
        calculatorBackend.buttonPressed(buttonLabel: "1")
        calculatorBackend.buttonPressed(buttonLabel: "=")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "3.1")
    }
    
    func test_buttonPressed_ButtonLabelsPressedAreThreeMinusOneThenEqual_UpdateNumberLabelCalledWithTwo() {
        calculatorBackend.buttonPressed(buttonLabel: "3")
        calculatorBackend.buttonPressed(buttonLabel: "-")
        calculatorBackend.buttonPressed(buttonLabel: "1")
        calculatorBackend.buttonPressed(buttonLabel: "=")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "2")
    }
    
    func test_buttonPressed_ButtonLabelsPressedAreThreeMultiplyTwoThenEqual_UpdateNumberLabelCalledWithSix() {
        calculatorBackend.buttonPressed(buttonLabel: "3")
        calculatorBackend.buttonPressed(buttonLabel: "x")
        calculatorBackend.buttonPressed(buttonLabel: "2")
        calculatorBackend.buttonPressed(buttonLabel: "=")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "6")
    }
    
    func test_buttonPressed_ButtonLabelsPressedAreFourDivideTwoThenEqual_UpdateNumberLabelCalledWithTwo() {
        calculatorBackend.buttonPressed(buttonLabel: "4")
        calculatorBackend.buttonPressed(buttonLabel: "÷")
        calculatorBackend.buttonPressed(buttonLabel: "2")
        calculatorBackend.buttonPressed(buttonLabel: "=")
        XCTAssertEqual(mockDelegate.updateNumberLabelCalledWith, "2")
    }
}

class MockCalculatorBackendDelegate: CalculatorBackendDelegate {
    var updateNumberLabelCalledWith: String = ""
    func updateNumberLabel(label: String) {
        updateNumberLabelCalledWith = label
    }
}
