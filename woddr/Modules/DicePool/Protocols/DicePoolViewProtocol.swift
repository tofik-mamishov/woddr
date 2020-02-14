//
//  DicePoolViewProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 09/11/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//
import UIKit

protocol DicePoolViewProtocol: class {
    var thresholdContainer: UIStackView! { get }

    func getDiceNumberPicker() -> UIPickerView

    func getDifficultyPicker() -> UIPickerView

    func getSuccessesNumber() -> UILabel

    func getSeeDetails() -> UIButton

    func getSuccessesLoadIndicator() -> UIActivityIndicatorView

    func getRollButton() -> UIButton

    func getThresholdValue() -> UILabel
}
