//
//  InitiativeRollAssembly.swift
//  woddr
//
//  Created by Tofik Mamishov on 09/02/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class InitiativeRollAssembly: NSObject {
    @IBOutlet weak var viewController: InitiativeRollViewController!

    override func awakeFromNib() {
        let interactor = InitiativeRollInteractor()
        let presenter = InitiativeRollPresenter(view: self.viewController, interactor: interactor)
        self.viewController.presenter = presenter
    }
}
