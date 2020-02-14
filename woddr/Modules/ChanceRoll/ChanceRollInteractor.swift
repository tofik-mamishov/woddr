//
//  ChanceRollInvoker.swift
//  woddr
//
//  Created by Tofik Mamishov on 16/11/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

class ChanceRollInteractor: ChanceRollInteractorProtocol {

    private var roller: ChanceRollerProtocol!

    var successCount: Int! {
        return self.roller.successCount
    }
    var rollResults: [Int]! {
        return self.roller.rollResults
    }
    var isDramaticFailure: Bool! {
        return self.roller.isDramaticFailure
    }

    init() {
        self.roller = ChanceRoller()
    }

    func roll() {
        self.roller.rollResults.removeAll()
        self.roller.successCount = 0
        self.roller.roll()
    }
}
