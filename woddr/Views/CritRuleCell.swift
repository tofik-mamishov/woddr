//
//  CritRuleCell.swift
//  woddr
//
//  Created by Tofik Mamishov on 02/02/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class CritRuleCell: CheckMarkCell {
    var rule: CritRuleType! {
        willSet {
            self.value.text = newValue.name
        }
    }
}
