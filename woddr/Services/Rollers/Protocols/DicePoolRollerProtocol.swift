//
//  RollerProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 21/02/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

protocol DicePoolRollerProtocol {
    var rollResults: [[RollResult]]! { get set }
    var successCount: Int { get set }
    var onesToCancel: Int { get set }

    func roll(count: Int)
}
