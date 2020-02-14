//
//  DPSettingsPresenterProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 08/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

protocol DPSettingsPresenterProtocol: class {
    var router: DPSettingsRouterProtocol! { get set }

    func viewDidLoad()

    func dismiss()

    func onClose()
}
