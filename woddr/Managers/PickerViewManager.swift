//
//  PickerViewDelegate.swift
//  woddr
//
//  Created by Tofik Mamishov on 12/12/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

import UIKit

class PickerViewManager: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    private let possibleValues: [Int]!
    private var pickerViewNumber: PickerViewNumber!
    private var componentsNumber: Int!

    var rowHeight: CGFloat!
    var widthOfComponent: CGFloat!
    var fontSize: CGFloat!
    var didSelectRowHandler: ((Int) -> Void)?

    required init(componentsNumber: Int) {
        self.possibleValues = Array(0...9)
        self.componentsNumber = componentsNumber
        self.pickerViewNumber = PickerViewNumber(numberOfPickerComponents: self.componentsNumber)
        self.rowHeight = 45.0
        self.widthOfComponent = 40.0
        self.fontSize = 50.0
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return self.componentsNumber
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.possibleValues.count
    }

    func pickerView(_ pickerView: UIPickerView,
                    viewForRow row: Int,
                    forComponent component: Int,
                    reusing view: UIView?) -> UIView {
        return self.view(for: row)
    }

    func pickerView(_ pickerView: UIPickerView,
                    rowHeightForComponent component: Int) -> CGFloat {
        return self.rowHeight
    }

    func pickerView(_ pickerView: UIPickerView,
                    widthForComponent component: Int) -> CGFloat {
        return self.widthOfComponent
    }

    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        self.pickerViewNumber.digits[component] = self.possibleValues[row]
        self.didSelectRowHandler?(self.value())
    }

    func setValue(_ pickerView: UIPickerView, value: Int) {
        self.pickerViewNumber.setValue(value: value)
        for digitIndex in 0..<self.pickerViewNumber.digits.count {
            let row = self.possibleValues.firstIndex(of: self.pickerViewNumber.digits[digitIndex])
            pickerView.selectRow(row!, inComponent: digitIndex, animated: false)
        }
    }

    func value() -> Int {
        return self.pickerViewNumber.value
    }

    private func view(for row: Int) -> UIView {
        let label = UILabel()
        label.text = String(self.possibleValues[row])
        label.backgroundColor = nil
        label.textColor = UIColor.white
        label.font = UIFont(name: "Avenir-Heavy", size: self.fontSize)
        label.textAlignment = .center
        return label
    }
}
