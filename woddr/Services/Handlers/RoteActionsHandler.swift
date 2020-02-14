//
//  RoteActionsHandler.swift
//  woddr
//
//  Created by Tofik Mamishov on 21/01/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

class RoteActionsHandler: RollHandlerProtocol {
    private static let successPoint = 8

    private var next: RollHandlerProtocol?
    private var dicePoolPresetsService: DicePoolPresetsService!

    required init(next: RollHandlerProtocol?) {
        self.next = next
        self.dicePoolPresetsService = DicePoolPresetsService()
    }
    func handle(rollResultProvider: RollResultProvider) -> RollResultProvider {
        guard rollResultProvider.throwIndex == 0 &&
            rollResultProvider.rollResult.value < RoteActionsHandler.successPoint else {
                return next?.handle(rollResultProvider: rollResultProvider) ?? rollResultProvider
        }
        rollResultProvider.rollResult.type = .rote
        rollResultProvider.againCount += 1
        return rollResultProvider
    }
}
