//
//  CalculatorDaveyUITests.swift
//  CalculatorDaveyUITests
//
//  Created by John Davey Ferrer on 2021-10-07.
//

import XCTest

class CalculatorDaveyUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

    }
    
    // UI Test 1 (to verify Addition Operation)
    func testAdditionFunction() {
        
        
        app.buttons["4"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["+"]/*[[".buttons[\"+\"].staticTexts[\"+\"]",".staticTexts[\"+\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["5"].tap()
        app.buttons["="].tap()
     
        
    }
    
    // UI Test 2 (to verify Subtraction Operation)
    func testSubtractionFunction() {
        
        
        app.buttons["9"].tap()
        app.buttons["-"].tap()
        app.buttons["6"].tap()
        app.buttons["="].tap()
      
    }
    
    // UI Test 3 (to verify Multiplication Operation)
    func testMultiplicationFunction() {
        
        
        app.buttons["1"].tap()
        app.buttons["×"].tap()
        app.buttons["8"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["="]/*[[".buttons[\"=\"].staticTexts[\"=\"]",".staticTexts[\"=\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
    }
    
    // UI Test 4 (to verify Division Operation)
    func testDivisionFunction() {
        
    
        app/*@START_MENU_TOKEN@*/.staticTexts["5"]/*[[".buttons[\"5\"].staticTexts[\"5\"]",".staticTexts[\"5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["÷"].tap()
        app.buttons["5"].staticTexts["5"].tap()
        app.buttons["="].tap()
      
    }
    
    // UI Test 5 (to verify Pi Operation)
    func testPiFunction() {
        XCUIApplication()/*@START_MENU_TOKEN@*/.staticTexts["π"]/*[[".buttons[\"π\"].staticTexts[\"π\"]",".staticTexts[\"π\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
    }

}
