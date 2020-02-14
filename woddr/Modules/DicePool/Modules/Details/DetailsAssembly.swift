//
//  DetailsAssembly.swift
//  woddr
//
//  Created by Tofik Mamishov on 03/02/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class DetailsAssembly: NSObject {
    @IBOutlet weak var viewController: DetailsViewController!

    override func awakeFromNib() {
        let interactor = DetailsInteractor()
        let presenter = DetailsPresenter(view: self.viewController,
                                         interactor: interactor)
        self.viewController.presenter = presenter
    }
}
