//
//  WillpowerBoostCell.swift
//  woddr
//
//  Created by Tofik Mamishov on 17/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

class WillpowerBoostCell: CheckMarkCell {
    var boostType: WillpowerBoostType! {
        willSet {
            self.value.text = newValue.name
        }
    }
}
