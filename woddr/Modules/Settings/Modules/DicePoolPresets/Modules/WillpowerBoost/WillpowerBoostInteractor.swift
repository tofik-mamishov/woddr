//
//  WillpowerBoostInteractor.swift
//  woddr
//
//  Created by Tofik Mamishov on 17/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

class WillpowerBoostInteractor: WillpowerBoostInteractorProtocol {
    private let dicePoolPresetsService = DicePoolPresetsService()

    var willpowerBoost: WillpowerBoostType {
        get {
            return self.dicePoolPresetsService.willpowerBoostTypePreset
        }
        set {
            self.dicePoolPresetsService.willpowerBoostTypePreset = newValue
        }
    }
}
