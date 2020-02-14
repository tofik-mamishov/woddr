//
//  SettingsAssembly.swift
//  woddr
//
//  Created by Tofik Mamishov on 05/01/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//
import UIKit

class SettingsAssembly: NSObject {
    @IBOutlet weak var viewController: SettingsViewController!

    override func awakeFromNib() {
        let presenter = SettingsPresenter(view: self.viewController)
        self.viewController.presenter = presenter
    }
}
