//
//  InitiativeRollerProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 25/11/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

protocol InitiativeRollerProtocol: class {
    var rollResult: Int! { get set }
    var total: Int! { get set }

    func roll(modifier: Int)
}
