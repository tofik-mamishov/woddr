//
//  RollHandlersChainBuilder.swift
//  woddr
//
//  Created by Tofik Mamishov on 01/02/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

class RollHandlersChainBuilder {
    private static let dicePoolPresetsService = DicePoolPresetsService()

    //#TODO change the logic of all handlers to make them work fine independently
    static func build() -> RollHandlerProtocol {
        let critRollHandler = getCritRollHandler(next: nil)
        let successRollHandler = getSuccessRollHandler(next: critRollHandler)
        let cancelSuccessHandler = getCancelSuccessHandler(next: successRollHandler)
        return getRoteActionsHandler(next: cancelSuccessHandler)!
    }

    private static func getRoteActionsHandler(next: RollHandlerProtocol?) -> RollHandlerProtocol? {
        guard RollHandlersChainBuilder.dicePoolPresetsService.roteActionsPreset else {
            return next
        }
        return RoteActionsHandler(next: next)
    }

    private static func getCritRollHandler(next: RollHandlerProtocol?) -> RollHandlerProtocol? {
        let cirtRule = RollHandlersChainBuilder.dicePoolPresetsService.critRulePreset
        switch cirtRule {
        case .infiniteReroll:
            return InfiniteRerollHandler(next: next)
        case .doubleSuccess:
            return DoubleSuccessHandler(next: next)
        case .reroll:
            return RerollHandler(next: next)
        case .noReroll:
            return next
        }
    }

    private static func getSuccessRollHandler(next: RollHandlerProtocol?) -> RollHandlerProtocol? {
        return SuccessRollHandler(next: next)
    }

    private static func getCancelSuccessHandler(next: RollHandlerProtocol?) -> RollHandlerProtocol? {
        guard RollHandlersChainBuilder.dicePoolPresetsService.cancelSuccessPreset else {
            return next
        }
        return CancelSuccessHandler(next: next)
    }
}
