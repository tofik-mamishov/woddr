//
//  SimplePickerViewManager.swift
//  woddr
//
//  Created by Tofik Mamishov on 09/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class SimplePickerViewManager: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    private let possibleValues: [Int]!
    private var componentsNumber: Int!

    var rowHeight: CGFloat!
    var widthOfComponent: CGFloat!
    var fontSize: CGFloat!
    var didSelectRowHandler: ((Int) -> Void)?

    required init(possibleValues: [Int]) {
        self.possibleValues = possibleValues
        self.componentsNumber = 1
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
        self.didSelectRowHandler?(self.possibleValues[row])
    }

    func setValue(_ pickerView: UIPickerView, value: Int) {
            let row = self.possibleValues.firstIndex(of: value)
            pickerView.selectRow(row!, inComponent: 0, animated: false)
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
