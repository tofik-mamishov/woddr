//
//  Dice.swift
//  woddr
//
//  Created by Tofik Mamishov on 30/01/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

class Dice: DiceProtocol {
    static let sideCount = 10

    private let randomizer: DiceRandomizerProtocol!

    init() {
        self.randomizer = DiceRandomizer()
    }

    func roll() -> Int {
        return self.randomizer.rand(sideCount: Dice.sideCount)
    }
}
