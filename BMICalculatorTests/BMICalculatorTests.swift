//
//  BMICalculatorTests.swift
//  BMICalculatorTests
//
//  Created by Jessica Mallian on 8/13/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import XCTest
@testable import BMICalculator

class BMICalculatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(true)
    }
    
    func testBMIImperial1() {
        let bmi = BodyCalculations.getBMI(heightInInches: 66, weightInPounds: 124)
        XCTAssertEqual(bmi, 20.0)
    }
    
    func testMetrict1() {
        let bmi = BodyCalculations.getBMI(heightInCentimeters: 168, weightInKilograms: 56)
        XCTAssertEqual(bmi, 19.8)
    }
    
    func testMetricWeightImperialHeight1() {
        let bmi = BodyCalculations.getBMI(heightInInches: 66, weightInKilograms: 56)
        XCTAssertEqual(bmi, 19.9)
    }
    
    func testImperialWeightMetricHeight1() {
        let bmi = BodyCalculations.getBMI(heightInCentimeters: 168, weightInPounds: 124)
        XCTAssertEqual(bmi, 19.9)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
