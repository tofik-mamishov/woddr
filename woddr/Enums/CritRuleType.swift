//
//  CritRuleType.swift
//  woddr
//
//  Created by Tofik Mamishov on 08/02/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

enum CritRuleType: Int, CaseIterable {
    case noReroll = 0
    case reroll
    case infiniteReroll
    case doubleSuccess

    var name: String {
        switch self {
        case .noReroll:
            return "No reroll"
        case .reroll:
            return "Reroll"
        case .infiniteReroll:
            return "Infinite reroll"
        case .doubleSuccess:
            return "Double success"
        }
    }
}
