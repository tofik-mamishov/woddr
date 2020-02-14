//
//  DPMiniSettingsRouter.swift
//  woddr
//
//  Created by Tofik Mamishov on 09/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//
import UIKit

class DPMiniSettingsRouter: DPMiniSettingsRouterProtocol {
    weak var presenter: DPMiniSettingsPresenterProtocol!

    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier ?? ""
        let destination = segue.destination
        switch identifier {
        case "DPSettings":
            guard let destViewController = destination as? DPSettingsViewController else {
                fatalError("Unexpected destination: \(destination)")
            }
            destViewController.presenter.router.outModulePresenter = self.presenter
        default:
            return
        }
    }
}
