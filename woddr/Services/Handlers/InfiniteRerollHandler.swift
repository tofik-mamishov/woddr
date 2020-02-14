//
//  InfiniteRerollHandler.swift
//  woddr
//
//  Created by Tofik Mamishov on 20/01/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

class InfiniteRerollHandler: RollHandlerProtocol {
    private var next: RollHandlerProtocol?
    private var dicePoolPresetsService: DicePoolPresetsService!

    required init(next: RollHandlerProtocol?) {
        self.next = next
        self.dicePoolPresetsService = DicePoolPresetsService()
    }

    func handle(rollResultProvider: RollResultProvider) -> RollResultProvider {
        guard rollResultProvider.rollResult.value >= self.dicePoolPresetsService.againPointPreset else {
            return next?.handle(rollResultProvider: rollResultProvider) ?? rollResultProvider
        }
        rollResultProvider.rollResult.type = .again
        rollResultProvider.againCount += 1
        return rollResultProvider
    }
}
