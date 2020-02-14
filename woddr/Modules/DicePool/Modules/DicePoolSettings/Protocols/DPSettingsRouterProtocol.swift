//
//  DPSettingsRouterProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 09/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

protocol DPSettingsRouterProtocol: class {
    var outModulePresenter: DPMiniSettingsPresenterProtocol! { get set }
    var presenter: DPSettingsPresenterProtocol! { get set }

    func close()
}
