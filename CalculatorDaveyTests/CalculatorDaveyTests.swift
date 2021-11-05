//
//  CalculatorDaveyTests.swift
//  CalculatorDaveyTests
//
//  Created by John Davey Ferrer on 2021-10-05.
//

import XCTest

//import App CalculatorDavey and declare as testable
@testable import CalculatorDavey



class CalculatorDaveyTests: XCTestCase {
    var sut: CalculatorBrain!
    
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        sut = CalculatorBrain()
    }

    override func tearDownWithError() throws {
       
        sut = nil
        try super.tearDownWithError()
    }
    
    // Unit Test 1 (to verify Sine Opeation)
    func testSineOperation() throws {
        
        let operation = sine(operand: 9)
        XCTAssertEqual(operation, 0.15643446504023087)
        
    }
    
    // Unit Test 2 (to verify Cosine Opeation)
    func testCosineOperation() throws {
        
        let operation = cosine(operand: 10)
        XCTAssertEqual(operation, 0.984807753012208)
        
    }
    
    // Unit Test 3 (to verify Tangent Opeation)
    func testTangentOperation() throws {
        
        let operation = tangent(operand: 5)
        XCTAssertEqual(operation, 0.087488663525924)
        
    }
    
    // Unit Test 4 (to verify Squared Operation)
    func testSquaredOperation() throws {
        
        let operation = square(operand: 6)
        XCTAssertEqual(operation, 36)
        
    }
    
    // Unit Test 5 (to verify Percent Opeation)
    func testPercentOperation() throws {
        
        let operation = percent(operand: 100)
        XCTAssertEqual(operation, 1.0)
        
    }
    
}
