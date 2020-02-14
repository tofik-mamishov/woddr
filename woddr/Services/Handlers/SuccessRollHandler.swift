//
//  SuccessRollHandler.swift
//  woddr
//
//  Created by Tofik Mamishov on 20/01/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//
class SuccessRollHandler: RollHandlerProtocol {

    private var next: RollHandlerProtocol?
    private var dicePoolPresetsService: DicePoolPresetsService!

    required init(next: RollHandlerProtocol?) {
        self.next = next
        self.dicePoolPresetsService = DicePoolPresetsService()
    }

    func handle(rollResultProvider: RollResultProvider) -> RollResultProvider {
        let successPoint = self.dicePoolPresetsService.difficultyPreset
        guard rollResultProvider.rollResult.value >= successPoint else {
            return rollResultProvider
        }
        rollResultProvider.rollResult.type = .success
        rollResultProvider.successCount += 1
        return next?.handle(rollResultProvider: rollResultProvider) ?? rollResultProvider
    }
}
