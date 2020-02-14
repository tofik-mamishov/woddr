//
//  RollResult.swift
//  woddr
//
//  Created by Tofik Mamishov on 20/02/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

class RollResult {
    var value: Int
    var type: RollResultType

    init(value: Int) {
        self.value = value
        self.type = .fail
    }

    init(value: Int, type: RollResultType) {
        self.value = value
        self.type = type
    }
}
