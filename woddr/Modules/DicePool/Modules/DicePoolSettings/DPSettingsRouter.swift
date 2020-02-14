//
//  DPSettingsRouter.swift
//  woddr
//
//  Created by Tofik Mamishov on 09/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

class DPSettingsRouter: DPSettingsRouterProtocol {
    weak var outModulePresenter: DPMiniSettingsPresenterProtocol!
    weak var presenter: DPSettingsPresenterProtocol!

    func close() {
        self.outModulePresenter.loadDiceDifficulty()
        outModulePresenter.loadAgain()
        //self.outModulePresenter.loadWillpowerBoost()
        self.outModulePresenter.fadeIn()
    }
}
