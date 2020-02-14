//
//  WillpowerBoostType.swift
//  woddr
//
//  Created by Tofik Mamishov on 15/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

enum WillpowerBoostType: Int, CaseIterable {
    case noBoost = 0
    case onePoint
    case noLimit

    var name: String {
        switch self {
        case .noBoost:
            return "No boost"
        case .onePoint:
            return "One point"
        case .noLimit:
            return "No limit"
        }
    }
}
