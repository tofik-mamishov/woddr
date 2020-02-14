//
//  SettingsPresenter.swift
//  woddr
//
//  Created by Tofik Mamishov on 04/01/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//
import UIKit

class SettingsPresenter: SettingsPresenterProtocol {
    private weak var view: SettingsViewProtocol!
    private var mailManager: MailManager!

    init(view: SettingsViewProtocol) {
        self.view = view
        let mailComposeViewControllerDelegate = MailComposeViewControllerDelegate()
        self.mailManager = MailManager(delegate: mailComposeViewControllerDelegate)
    }
    func displayCompositionInterface(subject: String) {
        self.view.present(self.mailManager.mailComposeViewController(subject: subject))
    }
}
