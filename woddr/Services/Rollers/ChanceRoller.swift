//
//  ChanceRoller.swift
//  woddr
//
//  Created by Tofik Mamishov on 29/11/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

class ChanceRoller: ChanceRollerProtocol {
    private static let successPoint = 10
    private static let againPoint = 10

    private let dice: DiceProtocol!

    var rollResults: [Int]!
    var successCount: Int!
    var isDramaticFailure: Bool!

    init() {
        self.dice = Dice()
        self.rollResults = [Int]()
        self.successCount = 0
        self.isDramaticFailure = false
    }

    func roll() {
        let rollResult = self.dice.roll()
        self.rollResults.append(rollResult)
        if ChanceRoller.successPoint <= rollResult {
            self.successCount += 1
            if ChanceRoller.againPoint <= rollResult {
                self.roll()
            }
        }
        if self.rollResults.count == 1 {
            self.isDramaticFailure = rollResult == 1
        }
    }
}
