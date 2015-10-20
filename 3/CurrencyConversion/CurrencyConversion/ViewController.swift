//
//  ViewController.swift
//  CurrencyConversion
//
//  Created by Marc Schwieterman on 10/17/15.
//  Copyright © 2015 Marc Schwieterman Software, LLC. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var fromCurrencyPicker: UIPickerView! {
        didSet {
            fromCurrencyPicker.selectRow(1, inComponent: 0, animated: false)
        }
    }

    @IBOutlet weak var toCurrencyPicker: UIPickerView! {
        didSet {
            toCurrencyPicker.selectRow(0, inComponent: 0, animated: false)
        }
    }

    @IBOutlet weak var fromValueField: UITextField!
    @IBOutlet weak var toValueField: UITextField!

    private let USDToEURConverter = CurrencyConverter(rate: 0.882163)
    private let EURToUSDConverter = CurrencyConverter(rate: 1.13358)

    override func viewDidLoad() {
        fromValueField.becomeFirstResponder()
    }

    @IBAction func fromAmountDidChange() {
        if let fromValue = fromValueField.text where !fromValue.isEmpty {
            toValueField.text = EURToUSDConverter.convert(fromValue)
        }
    }

    @IBAction func toAmountDidChange() {
        if let toValue = toValueField.text where !toValue.isEmpty {
            fromValueField.text = USDToEURConverter.convert(toValue)
        }
    }

}

extension ViewController: UIPickerViewDataSource {

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }

}

extension ViewController: UIPickerViewDelegate {

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return row == 0 ? "USD" : "EU"
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }

}
