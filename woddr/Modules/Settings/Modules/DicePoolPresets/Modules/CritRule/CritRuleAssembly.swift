//
//  CritRuleAssembly.swift
//  woddr
//
//  Created by Tofik Mamishov on 03/02/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class CritRuleAssembly: NSObject {
    @IBOutlet weak var viewController: CritRuleViewController!

    override func awakeFromNib() {
        let interactor = CritRuleInteractor()
        let presenter = CritRulePresenter(view: self.viewController,
                                            interactor: interactor)
        self.viewController.presenter = presenter
    }
}
