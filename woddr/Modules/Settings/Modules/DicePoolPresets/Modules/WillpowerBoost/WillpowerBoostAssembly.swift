//
//  WillpowerBoostAssembly.swift
//  woddr
//
//  Created by Tofik Mamishov on 17/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class WillpowerBoostAssembly: NSObject {
    @IBOutlet weak var viewController: WillpowerBoostViewController!

    override func awakeFromNib() {
        let interactor = WillpowerBoostInteractor()
        let presenter = WillpowerBoostPresenter(view: self.viewController,
                                                interactor: interactor)
        self.viewController.presenter = presenter
    }
}
