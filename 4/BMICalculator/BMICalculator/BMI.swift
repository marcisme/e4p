//
//  BMI.swift
//  BMICalculator
//
//  Created by Marc Schwieterman on 10/26/15.
//  Copyright © 2015 Marc Schwieterman Software, LLC. All rights reserved.
//

import Foundation


struct BMI {

    enum Category {
        case Underweight
        case Normal
        case Overweight
    }

    let height: Float
    let weight: Float

    init(height: Float, weight: Float) {
        self.height = height
        self.weight = weight
    }

    var value: Float {
        return 703 * (weight / pow(height, 2))
    }

    var category: Category {
        if value <= 18.5 {
            return .Underweight
        }
        if value >= 25 {
            return .Overweight
        }
        return .Normal
    }

}
