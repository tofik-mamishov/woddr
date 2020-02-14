//
//  PickerViewNumber.swift
//  woddr
//
//  Created by Tofik Mamishov on 28/02/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//
import Foundation

class PickerViewNumber {
    private static let baseNumber = 10

    var digits: [Int]!
    var value: Int {
        var value = 0
        for digitIndex in 0..<digits.count {
            let intMultiplier = Int(truncating: self.multiplier(index: digitIndex))
            value += digits[digitIndex] * intMultiplier
        }
        return value
    }

    init(numberOfPickerComponents: Int) {
        digits = [Int](repeating: 0, count: numberOfPickerComponents)
    }

    func isZero() -> Bool {
        for digitIndex in 0..<digits.count where digits[digitIndex] != 0 {
            return false
        }
        return true
    }

    func setValue(value: Int) {
        var number = value
        var digit = 0
        for digitIndex in (0..<self.digits.count).reversed() {
            digit = number % Int(PickerViewNumber.baseNumber)
            self.digits[digitIndex] = digit
            number /= PickerViewNumber.baseNumber
        }
    }

    private func multiplier(index: Int) -> NSDecimalNumber {
        return pow(Decimal(PickerViewNumber.baseNumber),
                   digits.count - 1 - index) as NSDecimalNumber
    }
}
