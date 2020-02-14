//
//  DPMiniSettingsAssembly.swift
//  woddr
//
//  Created by Tofik Mamishov on 09/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class DPMiniSettingsAssembly: UIPickerView {
    @IBOutlet weak var viewController: DPMiniSettingsViewController!

    override func awakeFromNib() {
        let interactor = DPMiniSettingsInteractor()
        let presenter = DPMiniSettingsPresenter(view: self.viewController,
                                            interactor: interactor)
        let router = DPMiniSettingsRouter()
        router.presenter = presenter
        presenter.router = router
        self.viewController.presenter = presenter
    }
}
