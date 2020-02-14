//
//  DicePoolPresetsInteractor.swift
//  woddr
//
//  Created by Tofik Mamishov on 12/01/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//
import Foundation

class DicePoolPresetsInteractor: DicePoolPresetsInteractorProtocol {

    private let dicePoolPresetsService = DicePoolPresetsService()

    var willpowerBoost: WillpowerBoostType {
        get {
            return self.dicePoolPresetsService.willpowerBoostTypePreset
        }
        set {
            self.dicePoolPresetsService.willpowerBoostTypePreset = newValue
        }
    }

    var showThreshold: Bool {
        get {
            return dicePoolPresetsService.showThresholdPreset
        }
        set {
            dicePoolPresetsService.showThresholdPreset = newValue
        }
    }

    func saveRoteActionsPreset(value: Bool) {
        self.dicePoolPresetsService.roteActionsPreset = value
    }

    func roteActionsPreset() -> Bool {
        return self.dicePoolPresetsService.roteActionsPreset
    }

    func critRulePreset() -> CritRuleType {
        return self.dicePoolPresetsService.critRulePreset
    }

    func saveCancelSuccessPreset(value: Bool) {
        self.dicePoolPresetsService.cancelSuccessPreset = value
    }

    func cancelSuccessPreset() -> Bool {
        return self.dicePoolPresetsService.cancelSuccessPreset
    }
}
