//
//  CurrencyConversionTests.swift
//  CurrencyConversionTests
//
//  Created by Marc Schwieterman on 10/17/15.
//  Copyright © 2015 Marc Schwieterman Software, LLC. All rights reserved.
//

import XCTest
@testable import CurrencyConversion


class CurrencyConversionTests: XCTestCase {

    func testConversion() {
        let converter = CurrencyConverter(rate: 1.3751)
        XCTAssertEqual(converter.convert("81.0"), "111.39")
    }

}
