//
//  BMITests.swift
//  BMICalculatorTests
//
//  Created by Marc Schwieterman on 10/26/15.
//  Copyright © 2015 Marc Schwieterman Software, LLC. All rights reserved.
//

import XCTest
@testable import BMICalculator


class BMICalculatorTests: XCTestCase {

    func testUnderweight() {
        let bmi = BMI(height: 61.7, weight: 100)
        XCTAssertLessThanOrEqual(bmi.value, 18.5)
        XCTAssertGreaterThanOrEqual(bmi.value, 18.4)
        XCTAssertEqual(bmi.category, BMI.Category.Underweight)
    }

    func testNormalLow() {
        let bmi = BMI(height: 61.6, weight: 100)
        XCTAssertGreaterThanOrEqual(bmi.value, 18.5)
        XCTAssertLessThanOrEqual(bmi.value, 18.6)
        XCTAssertEqual(bmi.category, BMI.Category.Normal)
    }

    func testNormalHigh() {
        let bmi = BMI(height: 53.1, weight: 100)
        XCTAssertGreaterThanOrEqual(bmi.value, 24.9)
        XCTAssertLessThanOrEqual(bmi.value, 25.0)
        XCTAssertEqual(bmi.category, BMI.Category.Normal)
    }

    func testOverweight() {
        let bmi = BMI(height: 53.0, weight: 100)
        XCTAssertGreaterThanOrEqual(bmi.value, 25)
        XCTAssertLessThanOrEqual(bmi.value, 25.1)
        XCTAssertEqual(bmi.category, BMI.Category.Overweight)
    }

}
