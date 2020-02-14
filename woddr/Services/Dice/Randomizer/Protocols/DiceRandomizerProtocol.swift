//
//  Randomizer.swift
//  woddr
//
//  Created by Tofik Mamishov on 29/01/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

import GameKit

protocol DiceRandomizerProtocol {
    func rand(sideCount: Int) -> Int
}
