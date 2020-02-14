//
//  DicePoolInvoker.swift
//  woddr
//
//  Created by Tofik Mamishov on 12/11/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

class DicePoolInteractor: DicePoolInteractorProtocol {

    private var roller: DicePoolRollerProtocol!
    private var dicePoolPresetsService: DicePoolPresetsService!

    var successCount: Int! {
        return self.roller.successCount +
            dicePoolPresetsService.willpowerBoostPreset
    }
    var rollResults: [[RollResult]]! {
        return self.roller.rollResults
    }

    var showThreshold: Bool {
        get {
            return dicePoolPresetsService.showThresholdPreset
        }
        set {
            dicePoolPresetsService.showThresholdPreset = newValue
        }
    }

    init() {
        self.roller = DicePoolRoller()
        self.dicePoolPresetsService = DicePoolPresetsService()
    }

    func roll(count: Int) {
        self.roller.rollResults.removeAll()
        self.roller.successCount = 0
        if dicePoolPresetsService.cancelSuccessPreset {
            roller.onesToCancel = dicePoolPresetsService.cancelationOfOnePreset
        }
        self.roller.roll(count: count)
    }

    func saveDifficultyPreset(value: Int) {
        self.dicePoolPresetsService.successRatePreset = value
    }

    func difficultyPreset() -> Int {
        return self.dicePoolPresetsService.successRatePreset
    }

    func thresholdValue() -> Int {
        let thresholdValue = self.successCount - self.difficultyPreset()
        guard thresholdValue >= 0 else {
            return 0
        }
        return thresholdValue
    }

    func diceDifficultyPreset() -> Int {
        return self.dicePoolPresetsService.difficultyPreset
    }
}
