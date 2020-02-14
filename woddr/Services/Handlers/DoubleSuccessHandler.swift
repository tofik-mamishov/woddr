//
//  DoubleSuccessHandler.swift
//  woddr
//
//  Created by Tofik Mamishov on 01/02/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

class DoubleSuccessHandler: RollHandlerProtocol {
    private var next: RollHandlerProtocol?
    private var dicePoolPresetsService: DicePoolPresetsService!

    required init(next: RollHandlerProtocol?) {
        self.next = next
        self.dicePoolPresetsService = DicePoolPresetsService()
    }

    func handle(rollResultProvider: RollResultProvider) -> RollResultProvider {
        let againPoint = self.dicePoolPresetsService.againPointPreset
        guard rollResultProvider.rollResult.value >= againPoint &&
            againPoint > self.dicePoolPresetsService.difficultyPreset else {
            return next?.handle(rollResultProvider: rollResultProvider) ?? rollResultProvider
        }
        rollResultProvider.rollResult.type = .doubleSuccess
        rollResultProvider.successCount += 1
        return rollResultProvider
    }
}
