//
//  DPMiniSettingsInteractorProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 07/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

protocol DPMiniSettingsInteractorProtocol: class {
    var diceDifficultyPreset: Int { get }

    var willPowerBoostPreset: Int { get }

    var cancelSuccessPreset: Bool { get }

    var onesToCancel: Int { get }

    var againPreset: Int { get }
}
