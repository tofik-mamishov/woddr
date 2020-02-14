//
//  DicePoolPresetsInteractorProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 12/01/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

protocol DicePoolPresetsInteractorProtocol: class {
    var willpowerBoost: WillpowerBoostType { get set }

    var showThreshold: Bool { get set }

    func saveRoteActionsPreset(value: Bool)

    func roteActionsPreset() -> Bool

    func critRulePreset() -> CritRuleType

    func saveCancelSuccessPreset(value: Bool)

    func cancelSuccessPreset() -> Bool
}
