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
    
    func testBmiDescription1() {
        let bmiDesc = BMI.getDescription(bmi: 12.0)
        XCTAssertEqual(bmiDesc, "Very Severely Underweight")
    }
    
    func testBmiDescription2() {
        let bmiDesc = BMI.getDescription(bmi: 15.2)
        XCTAssertEqual(bmiDesc, "Severely Underweight")
    }
    
    func testBmiDescription3() {
        let bmiDesc = BMI.getDescription(bmi: 18.2)
        XCTAssertEqual(bmiDesc, "Underweight")
    }
    
    func testBmiDescription4() {
        let bmiDesc = BMI.getDescription(bmi: 20.0)
        XCTAssertEqual(bmiDesc, "Normal (healthy weight)")
    }
    
    func testBmiDescription5() {
        let bmiDesc = BMI.getDescription(bmi: 25.2)
        XCTAssertEqual(bmiDesc, "Overweight")
    }
    
    func testBmiDescription6() {
        let bmiDesc = BMI.getDescription(bmi: 33.3)
        XCTAssertEqual(bmiDesc, "Obese Class I (moderately obese)")
    }
    
    func testBmiDescription7() {
        let bmiDesc = BMI.getDescription(bmi: 39.2)
        XCTAssertEqual(bmiDesc, "Obese Class II (severely obese)")
    }
    
    func testBmiDescription8() {
        let bmiDesc = BMI.getDescription(bmi: 44.2)
        XCTAssertEqual(bmiDesc, "Obese Class III (very severely obese)")
    }
    
    func testBmiDescription9() {
        let bmiDesc = BMI.getDescription(bmi: 48.3)
        XCTAssertEqual(bmiDesc, "Obese Class IV (morbidly obese)")
    }
    
    func testBmiDescription10() {
        let bmiDesc = BMI.getDescription(bmi: 58.3)
        XCTAssertEqual(bmiDesc, "Obese Class V (super obese)")
    }
    
    func testBmiDescription11() {
        let bmiDesc = BMI.getDescription(bmi: 60.0)
        XCTAssertEqual(bmiDesc, "Obese Class V (super obese)")
    }
    
    func testBmiDescription12() {
        let bmiDesc = BMI.getDescription(bmi: 65.2532)
        XCTAssertEqual(bmiDesc, "Obese Class VI (hyper obese)")
    }
    
    func testBmiDescription13() {
        let bmiDesc = BMI.getDescription(bmi: 24.3423)
        XCTAssertEqual(bmiDesc, "Normal (healthy weight)")
    }

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
