//
//  ChanceRollAssembly.swift
//  woddr
//
//  Created by Tofik Mamishov on 09/02/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class ChanceRollAssembly: NSObject {
    @IBOutlet weak var viewController: ChanceRollViewController!

    override func awakeFromNib() {
        let interactor = ChanceRollInteractor()
        let presenter = ChanceRollPresenter(view: self.viewController, interactor: interactor)
        self.viewController.presenter = presenter
    }
}
