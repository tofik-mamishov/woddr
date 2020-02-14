//
//  DiceRandomizer.swift
//  woddr
//
//  Created by Tofik Mamishov on 21/02/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//
import GameKit

class DiceRandomizer: DiceRandomizerProtocol {
    private let source: GKRandomSource!

    init() {
        self.source = GKMersenneTwisterRandomSource()
    }

    func rand(sideCount: Int) -> Int {
        let distribution = GKRandomDistribution(randomSource: source,
                                            lowestValue: 1,
                                            highestValue: sideCount)
        return distribution.nextInt()
    }
}
