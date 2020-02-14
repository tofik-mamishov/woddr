//
//  DPSettingsInteractorProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 08/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

protocol DPSettingsInteractorProtocol: class {

    var willPowerBoostTypePreset: WillpowerBoostType { get }

    var willPowerBoostPreset: Int { get set }

    var againPointPreset: Int { get set }

    var cancelSuccessPreset: Bool { get set }

    var cancelationOfOnePreset: Int { get set }

    func saveDiceDifficultyPreset(value: Int)

    func diceDifficultyPreset() -> Int
}
