//
//  swift
//  woddr
//
//  Created by Tofik Mamishov on 19/01/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//
import Foundation

class DicePoolPresetsService {
    private let roteActionsPresetKey = "roteActionsPreset"
    private let againPointPresetKey = "againPointPreset"
    private let successRatePresetKey = "successRatePreset"
    private let critRulePresetKey = "critRulePreset"
    private let cancelSuccessPresetKey = "cancelSuccessPreset"
    private let cancelationOfOnePresetKey = "cancelationOfOnePreset"
    private let difficultyPresetKey = "difficultyPreset"
    private let willpowerBoostTypePresetKey = "willpowerBoostTypePreset"
    private let willpowerBoostPresetKey = "willpowerBoostPreset"
    private let showThresholdPresetKey = "showThresholdPreset"

    private let defaultsService = UserDefaultsService()

    var willpowerBoostTypePreset: WillpowerBoostType {
        get {
            let willpowerRuleInt = self.defaultsService.int(key: willpowerBoostTypePresetKey,
                                                       defaultValue: WillpowerBoostType.noBoost.rawValue)
            return WillpowerBoostType(rawValue: willpowerRuleInt) ?? WillpowerBoostType.noBoost
        }
        set {
            self.defaultsService.save(key: willpowerBoostTypePresetKey,
                                      value: newValue.rawValue)
            resetWillPowerBoost(for: newValue)
        }
    }

    var willpowerBoostPreset: Int {
        get {
            //return self.defaultsService.int(key: willpowerBoostPresetKey)
            return 0
        }
        set {
            //self.defaultsService.save(key: willpowerBoostPresetKey, value: newValue)
        }
    }

    var roteActionsPreset: Bool {
        get {
            return self.defaultsService.bool(key: roteActionsPresetKey)
        }
        set {
            self.defaultsService.save(key: roteActionsPresetKey,
                                      value: newValue)
        }
    }

    var againPointPreset: Int {
        get {
            return self.defaultsService.int(key: againPointPresetKey,
                                            defaultValue: 10)
        }
        set {
            self.defaultsService.save(key: againPointPresetKey,
                                      value: newValue)
        }
    }

    var successRatePreset: Int {
        get {
            return self.defaultsService.int(key: successRatePresetKey)
        }
        set {
            self.defaultsService.save(key: successRatePresetKey,
                                      value: newValue)
        }
    }

    var critRulePreset: CritRuleType {
        get {
            let critRuleInt = self.defaultsService.int(key: critRulePresetKey,
                                                       defaultValue: CritRuleType.infiniteReroll.rawValue)
            return CritRuleType(rawValue: critRuleInt) ?? CritRuleType.infiniteReroll
        }
        set {
            self.defaultsService.save(key: critRulePresetKey,
                                      value: newValue.rawValue)
        }
    }

    var cancelSuccessPreset: Bool {
        get {
            return self.defaultsService.bool(key: cancelSuccessPresetKey)
        }
        set {
            self.defaultsService.save(key: cancelSuccessPresetKey,
                                      value: newValue)
            if !newValue {
                cancelationOfOnePreset = 0
            }
        }
    }

    var cancelationOfOnePreset: Int {
        get {
            return self.defaultsService.int(key: cancelationOfOnePresetKey)
        }
        set {
            self.defaultsService.save(key: cancelationOfOnePresetKey,
                                      value: newValue)
        }
    }

    var difficultyPreset: Int {
        get {
            return self.defaultsService.int(key: difficultyPresetKey,
                                            defaultValue: 6)
        }
        set {
            self.defaultsService.save(key: difficultyPresetKey,
                                      value: newValue)
        }
    }

    var showThresholdPreset: Bool {
        get {
            return self.defaultsService.bool(key: showThresholdPresetKey)
        }
        set {
            self.defaultsService.save(key: showThresholdPresetKey,
                                      value: newValue)
        }
    }

    private func resetWillPowerBoost(for type: WillpowerBoostType) {
        switch type {
        case .noBoost:
            if willpowerBoostPreset > 0 {
                willpowerBoostPreset = 0
            }
        case .onePoint:
            if willpowerBoostPreset > 1 {
                willpowerBoostPreset = 1
            }
        default:
            return
        }
    }
}
