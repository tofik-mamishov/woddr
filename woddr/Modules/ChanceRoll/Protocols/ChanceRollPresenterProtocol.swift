//
//  ChanceRollPresenterProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 16/11/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

protocol ChanceRollPresenterProtocol: class {
    var successCount: Int! { get }
    var isDramaticFailure: Bool! { get }
    var rollResults: String! { get }

    func roll()
}
