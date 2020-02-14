//
//  DPSettingsInteractor.swift
//  woddr
//
//  Created by Tofik Mamishov on 08/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

class DPSettingsInteractor: DPSettingsInteractorProtocol {
    private var dicePoolPresetsService: DicePoolPresetsService!

    var willPowerBoostTypePreset: WillpowerBoostType {
        return dicePoolPresetsService.willpowerBoostTypePreset
    }

    var willPowerBoostPreset: Int {
        set {
            dicePoolPresetsService.willpowerBoostPreset = newValue
        }
        get {
            return dicePoolPresetsService.willpowerBoostPreset
        }
    }

    var againPointPreset: Int {
        set {
            dicePoolPresetsService.againPointPreset = newValue
        }
        get {
            return dicePoolPresetsService.againPointPreset
        }
    }

    var cancelSuccessPreset: Bool {
        set {
            dicePoolPresetsService.cancelSuccessPreset = newValue
        }
        get {
            return dicePoolPresetsService.cancelSuccessPreset
        }
    }

    var cancelationOfOnePreset: Int {
        set {
            dicePoolPresetsService.cancelationOfOnePreset = newValue
        }
        get {
            return dicePoolPresetsService.cancelationOfOnePreset
        }
    }

    init() {
        self.dicePoolPresetsService = DicePoolPresetsService()
    }

    func saveDiceDifficultyPreset(value: Int) {
        self.dicePoolPresetsService.difficultyPreset = value
    }

    func diceDifficultyPreset() -> Int {
        return self.dicePoolPresetsService.difficultyPreset
    }
}
