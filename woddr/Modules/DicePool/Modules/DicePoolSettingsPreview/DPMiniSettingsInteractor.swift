//
//  DPMiniSettingsInteractor.swift
//  woddr
//
//  Created by Tofik Mamishov on 07/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

class DPMiniSettingsInteractor: DPMiniSettingsInteractorProtocol {
    private var dicePoolPresetsService: DicePoolPresetsService!

    var diceDifficultyPreset: Int {
        return self.dicePoolPresetsService.difficultyPreset
    }

    var willPowerBoostPreset: Int {
        return dicePoolPresetsService.willpowerBoostPreset
    }

    var cancelSuccessPreset: Bool {
        return dicePoolPresetsService.cancelSuccessPreset
    }

    var onesToCancel: Int {
        return dicePoolPresetsService.cancelationOfOnePreset
    }

    var againPreset: Int {
        return dicePoolPresetsService.againPointPreset
    }

    init() {
        self.dicePoolPresetsService = DicePoolPresetsService()
    }
}
