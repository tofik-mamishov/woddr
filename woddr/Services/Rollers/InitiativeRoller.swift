//
//  InitiativeRoller.swift
//  woddr
//
//  Created by Tofik Mamishov on 25/11/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

class InitiativeRoller: InitiativeRollerProtocol {
    private let dice: DiceProtocol!

    var rollResult: Int!
    var total: Int!

    init() {
        self.dice = Dice()
        self.rollResult = 0
        self.total = 0
    }

    func roll(modifier: Int) {
        self.rollResult = self.dice.roll()
        self.total = self.rollResult + modifier
    }
}
