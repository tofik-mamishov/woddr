//
//  CritRuleInteractorProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 02/02/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

protocol CritRuleInteractorProtocol: class {
    func saveCritRulePreset(value: CritRuleType)

    func critRulePreset() -> CritRuleType
}
