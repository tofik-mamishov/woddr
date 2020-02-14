//
//  ChanceRollerProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 29/11/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

protocol ChanceRollerProtocol: class {
    var rollResults: [Int]! { get set }
    var successCount: Int! { get set }
    var isDramaticFailure: Bool! { get set }

    func roll()
}
