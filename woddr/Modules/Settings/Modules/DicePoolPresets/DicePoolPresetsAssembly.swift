//
//  DicePoolPresetsAssembly.swift
//  woddr
//
//  Created by Tofik Mamishov on 10/01/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//
import UIKit

class DicePoolPresetsAssembly: NSObject {

    @IBOutlet weak var viewController: DicePoolPresetsViewController!

    override func awakeFromNib() {
        let interactor = DicePoolPresetsInteractor()
        let presenter = DicePoolPresetsPresenter(view: viewController,
                                                 interactor: interactor)
        self.viewController.presenter = presenter
    }
}
