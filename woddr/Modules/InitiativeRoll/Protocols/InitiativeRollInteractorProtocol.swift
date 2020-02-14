//
//  InitiativeRollInteractorProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 18/11/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

protocol InitiativeRollInteractorProtocol: class {
    var rollResult: Int! { get }
    var total: Int! { get }

    func roll(modifier: Int)
}
