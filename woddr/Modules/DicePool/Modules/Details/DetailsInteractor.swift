//
//  DetailsInteractor.swift
//  woddr
//
//  Created by Tofik Mamishov on 03/02/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

class DetailsInteractor: DetailsInteractorProtocol {

    func critMark(for rollResult: RollResult) -> String? {
        switch rollResult.type {
        case .again,
             .rote:
            return " ↺"
        case .doubleSuccess:
            return "  +1"
        case .one:
            return "  -1"
        default:
            return nil
        }
    }
}
