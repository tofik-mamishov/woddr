//
//  RerollHandler.swift
//  woddr
//
//  Created by Tofik Mamishov on 03/02/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

class RerollHandler: RollHandlerProtocol {
    private var next: RollHandlerProtocol?
    private var dicePoolPresetsService: DicePoolPresetsService!

    required init(next: RollHandlerProtocol?) {
        self.next = next
        self.dicePoolPresetsService = DicePoolPresetsService()
    }

    func handle(rollResultProvider: RollResultProvider) -> RollResultProvider {
        guard rollResultProvider.rollResult.value >= self.dicePoolPresetsService.againPointPreset &&
            rollResultProvider.throwIndex == 0 else {
                return next?.handle(rollResultProvider: rollResultProvider) ?? rollResultProvider
        }
        rollResultProvider.rollResult.type = .again
        rollResultProvider.againCount += 1
        return rollResultProvider
    }
}
