//
//  CancelSuccessHandler.swift
//  woddr
//
//  Created by Tofik Mamishov on 12/02/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

class CancelSuccessHandler: RollHandlerProtocol {
    private static let cancelationPoint = 1
    private var next: RollHandlerProtocol?
    private var dicePoolPresetsService: DicePoolPresetsService!

    required init(next: RollHandlerProtocol?) {
        self.next = next
        self.dicePoolPresetsService = DicePoolPresetsService()
    }

    func handle(rollResultProvider: RollResultProvider) -> RollResultProvider {
        guard CancelSuccessHandler.cancelationPoint == rollResultProvider.rollResult.value else {
            return next?.handle(rollResultProvider: rollResultProvider) ?? rollResultProvider
        }
        if rollResultProvider.onesToCancel > 0 {
            rollResultProvider.onesToCancel -= 1
        } else {
            rollResultProvider.rollResult.type = .one
            rollResultProvider.successCount -= 1
        }
        return rollResultProvider
    }
}
