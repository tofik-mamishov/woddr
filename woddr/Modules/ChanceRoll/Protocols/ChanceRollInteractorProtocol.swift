//
//  ChanceRollInteractorProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 16/11/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

protocol ChanceRollInteractorProtocol: class {
    var successCount: Int! { get }
    var rollResults: [Int]! { get }
    var isDramaticFailure: Bool! { get }

    func roll()
}
