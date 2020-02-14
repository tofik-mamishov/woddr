//
//  RollResultProvider.swift
//  woddr
//
//  Created by Tofik Mamishov on 21/01/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

class RollResultProvider {
    var rollResult: RollResult!
    var throwIndex: Int!
    var successCount: Int!
    var againCount: Int!
    var onesToCancel: Int!

    init(value: Int, throwIndex: Int,
         successCount: Int, againCount: Int,
         onesToCancel: Int) {
        self.rollResult = RollResult(value: value)
        self.throwIndex = throwIndex
        self.successCount = successCount
        self.againCount = againCount
        self.onesToCancel = onesToCancel
    }
}
