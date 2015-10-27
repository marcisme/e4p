//
//  ViewController.swift
//  BMICalculator
//
//  Created by Marc Schwieterman on 10/26/15.
//  Copyright © 2015 Marc Schwieterman Software, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    static let defaultHeight: Float = 72
    static let defaultWeight: Float = 220

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!

    @IBOutlet weak var heightSlider: UISlider! {
        didSet {
            heightSlider.value = self.dynamicType.defaultHeight
            updateHeight()
        }
    }

    @IBOutlet weak var weightSlider: UISlider! {
        didSet {
            weightSlider.value = self.dynamicType.defaultWeight
            updateWeight()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateBmi()
    }

    @IBAction func heightChanged(sender: UISlider) {
        updateHeight()
        updateBmi()
    }

    @IBAction func weightChanged(sender: UISlider) {
        updateWeight()
        updateBmi()
    }

    private func updateHeight() {
        heightLabel.text = String(format: "%.0f", heightSlider.value)
    }

    private func updateWeight() {
        weightLabel.text = String(format: "%.0f", weightSlider.value)
    }

    private func updateBmi() {
        let bmi = BMI(height: heightSlider.value, weight: weightSlider.value)
        bmiLabel.text = String(format: "%.1f", bmi.value)
        bmiLabel.textColor = bmi.color
    }

}

extension BMI {

    var color: UIColor {
        switch self.category {
        case .Normal:
            return UIColor.greenColor()
        case .Underweight, .Overweight:
            return UIColor.redColor()
        }
    }

}
