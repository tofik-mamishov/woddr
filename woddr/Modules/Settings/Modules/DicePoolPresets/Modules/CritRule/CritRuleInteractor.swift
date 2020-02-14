//
//  CritRuleInteractor.swift
//  woddr
//
//  Created by Tofik Mamishov on 02/02/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

class CritRuleInteractor: CritRuleInteractorProtocol {
    private var service: DicePoolPresetsService!

    init() {
        self.service = DicePoolPresetsService()
    }

    func saveCritRulePreset(value: CritRuleType) {
        self.service.critRulePreset = value
    }

    func critRulePreset() -> CritRuleType {
        return self.service.critRulePreset
    }
}
