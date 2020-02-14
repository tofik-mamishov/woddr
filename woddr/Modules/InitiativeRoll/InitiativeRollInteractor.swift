//
//  InitiativeRollInteractor.swift
//  woddr
//
//  Created by Tofik Mamishov on 18/11/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

class InitiativeRollInteractor: InitiativeRollInteractorProtocol {
    private static let diceCount = 1

    private var roller: InitiativeRollerProtocol!

    var rollResult: Int! {
        return self.roller.rollResult
    }
    var total: Int! {
        return self.roller.total
    }

    init() {
        self.roller = InitiativeRoller()
    }

    func roll(modifier: Int) {
        self.roller.roll(modifier: modifier)
    }
}
