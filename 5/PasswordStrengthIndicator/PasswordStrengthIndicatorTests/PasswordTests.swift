//
//  PasswordTests.swift
//  PasswordStrengthIndicatorTests
//
//  Created by Marc Schwieterman on 11/1/15.
//  Copyright © 2015 Marc Schwieterman Software, LLC. All rights reserved.
//

import XCTest
@testable import PasswordStrengthIndicator


struct Password {

    enum Strength {
        case VeryWeak
        case Weak
        case Strong
        case VeryStrong
    }

    let value: String

    var strength: Strength {
//        let counts = value.counts
//        switch (counts.total, counts.numbers, counts.letters, counts.specialCharacters) {
        let counts = value.counts
        switch counts {
        case _ where counts.total < 8 && counts.letters == counts.total:
            return .Weak
        case _ where counts.total >= 8 && counts.letters > 0 && counts.numbers >= 1:
            return .Strong
        default:
            return .VeryWeak
        }
        if counts.total >= 8 {

        } else {

        }
        return .VeryWeak
    }

}

struct StringCounts {

    private let string: String

    var numbers: Int {
        return string.utf16.filter { NSCharacterSet.decimalDigitCharacterSet().characterIsMember($0) }.count
    }

    var isAllNumbers: Bool {
        return total == numbers
    }

    var letters: Int {
        return string.utf16.filter { NSCharacterSet.letterCharacterSet().characterIsMember($0) }.count
    }

    var isAllLetters: Bool {
        return total == letters
    }

    var specialCharacters: Int {
        return total - (numbers + letters)
    }

    var total: Int {
        return string.characters.count
    }

}

extension String {

    var counts: StringCounts {
        return StringCounts(string: self)
    }

}

class StringCountsTests: XCTestCase {

    func testNumbers() {
        XCTAssertEqual("".counts.numbers, 0)
        XCTAssertEqual("abc".counts.numbers, 0)
        XCTAssertEqual("123".counts.numbers, 3)
        XCTAssertEqual("1b3".counts.numbers, 2)
    }

    func testLetters() {
        XCTAssertEqual("".counts.letters, 0)
        XCTAssertEqual("123".counts.letters, 0)
        XCTAssertEqual("abc".counts.letters, 3)
        XCTAssertEqual("1b3".counts.letters, 1)
    }

    func testSpecialCharacters() {
        XCTAssertEqual("".counts.specialCharacters, 0)
        XCTAssertEqual("abc".counts.specialCharacters, 0)
        XCTAssertEqual("🐶🐮🐧".counts.specialCharacters, 3)
        XCTAssertEqual("a🐧c".counts.specialCharacters, 1)
    }

    func testTotal() {
        XCTAssertEqual("123abc".counts.total, 6)
    }

    func testIsAllNumbers() {
        XCTAssertTrue("123".counts.isAllNumbers)
        XCTAssertFalse("1b3".counts.isAllNumbers)
    }

    func testIsAllLetters() {
        XCTAssertTrue("abc".counts.isAllLetters)
        XCTAssertFalse("a2c".counts.isAllLetters)
    }

}


class PasswordTests: XCTestCase {

//    • A very weak password contains only numbers and is fewer than eight characters.

    func testVeryWeak() {
        let password = Password(value: "1234567")
        XCTAssertEqual(password.strength, Password.Strength.VeryWeak)
    }

//    • A weak password contains only letters and is fewer than eight characters.

    func testWeak() {
        let password = Password(value: "abcdefg")
        XCTAssertEqual(password.strength, Password.Strength.Weak)
    }

//    • A strong password contains letters and at least one number and is at least eight characters.

    func testStrong() {
        let password = Password(value: "1abcdefg")
        XCTAssertEqual(password.strength, Password.Strength.Strong)
    }


//    • A very strong password contains letters, numbers, and special characters and is at least eight characters.

    func testVeryStrong() {
        let password = Password(value: "1@bcdefg")
        XCTAssertEqual(password.strength, Password.Strength.VeryStrong)
    }

}
