//
//  DPSettingsAssembly.swift
//  woddr
//
//  Created by Tofik Mamishov on 08/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class DPSettingsAssembly: NSObject {
    @IBOutlet weak var viewController: DPSettingsViewController!

    override func awakeFromNib() {
        let interactor = DPSettingsInteractor()
        let presenter = DPSettingsPresenter(view: self.viewController,
                                            interactor: interactor)
        let router = DPSettingsRouter()
        router.presenter = presenter
        presenter.router = router
        self.viewController.presenter = presenter
    }
}
