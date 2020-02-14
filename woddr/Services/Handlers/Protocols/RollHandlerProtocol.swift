//
//  RollResultHandlerProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 20/01/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//
protocol RollHandlerProtocol: class {
    init(next: RollHandlerProtocol?)

    func handle(rollResultProvider: RollResultProvider) -> RollResultProvider
}
