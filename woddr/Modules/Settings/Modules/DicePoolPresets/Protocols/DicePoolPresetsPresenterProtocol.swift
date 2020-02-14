//
//  DicePoolPresetsPresenterProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 12/01/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

protocol DicePoolPresetsPresenterProtocol: class {

    func viewDidLoad()

    func viewWillAppear()

    func saveRoteActionsPreset(value: Bool)

    func saveCancelSuccessPreset(value: Bool)

    func saveShowThresholdPreset(value: Bool)
}
