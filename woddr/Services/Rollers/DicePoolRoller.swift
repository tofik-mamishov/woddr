//
//  Roller.swift
//  woddr
//
//  Created by Tofik Mamishov on 30/01/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//
import GameKit

class DicePoolRoller: DicePoolRollerProtocol {
    static let defaultAgainPoint = 10
    static let successPoint = 8

    private var dice: DiceProtocol!
    private var tmpRollResults: [RollResult]!
    private var againCount: Int = 0
    private var rollHandlersChain: RollHandlerProtocol!

    var rollResults: [[RollResult]]!
    var successCount: Int = 0
    var onesToCancel: Int = 0

    init() {
        self.dice = Dice()
        self.rollResults = [[RollResult]]()
        self.tmpRollResults = [RollResult]()
    }

    func roll(count: Int) {
        self.tmpRollResults.removeAll()
        self.againCount = 0
        for _ in 0 ..< count {
            self.rollOne()
        }
        guard !self.tmpRollResults.isEmpty else {
            return
        }
        self.rollResults.append(self.tmpRollResults)
        guard self.againCount > 0 else {
            return
        }
        self.roll(count: self.againCount)
    }

    private func rollOne() {
        let value = self.dice.roll()
        let rollResultProvider = RollHandlersChainBuilder.build()
            .handle(rollResultProvider:
                RollResultProvider(value: value,
                                   throwIndex: self.rollResults.count,
                                   successCount: self.successCount,
                                   againCount: self.againCount,
                                   onesToCancel: self.onesToCancel))

        self.successCount = rollResultProvider.successCount < 0 ?
            0 : rollResultProvider.successCount
        self.againCount = rollResultProvider.againCount
        self.tmpRollResults.append(rollResultProvider.rollResult!)
        self.onesToCancel = rollResultProvider.onesToCancel
    }
}
