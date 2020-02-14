//
//  DicePoolAssembly.swift
//  woddr
//
//  Created by Tofik Mamishov on 09/02/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class DicePoolAssembly: NSObject {
    @IBOutlet weak var viewController: DicePoolViewController!

    override func awakeFromNib() {
        let interactor = DicePoolInteractor()
        let presenter = DicePoolPresenter(view: viewController, interactor: interactor)
        let router = DicePoolRouter(presenter: presenter)
        presenter.router = router
        self.viewController.presenter = presenter
    }
}
