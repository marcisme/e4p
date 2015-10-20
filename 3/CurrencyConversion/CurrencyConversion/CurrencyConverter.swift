//
//  CurrencyConverter.swift
//  CurrencyConversion
//
//  Created by Marc Schwieterman on 10/19/15.
//  Copyright © 2015 Marc Schwieterman Software, LLC. All rights reserved.
//

import Foundation


class CurrencyConverter {

    static let behavior = NSDecimalNumberHandler(roundingMode: .RoundUp, scale: 2, raiseOnExactness: true, raiseOnOverflow: true, raiseOnUnderflow: true, raiseOnDivideByZero: true)

    let rate: NSDecimalNumber

    init(rate: Double) {
        self.rate = NSDecimalNumber(double: rate)
    }

    func convert(amount: String) -> String {
        let decimalAmount = NSDecimalNumber(string: amount)
        let convertedAmount = decimalAmount.decimalNumberByMultiplyingBy(rate)
        return convertedAmount.decimalNumberByRoundingAccordingToBehavior(self.dynamicType.behavior).description
    }

}
