//
//  DicePoolInvokerProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 12/11/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

protocol DicePoolInteractorProtocol: class {
    var successCount: Int! { get }

    var rollResults: [[RollResult]]! { get }

    var showThreshold: Bool { get }

    func roll(count: Int)

    func saveDifficultyPreset(value: Int)

    func difficultyPreset() -> Int

    func thresholdValue() -> Int

    func diceDifficultyPreset() -> Int
}
