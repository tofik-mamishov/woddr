//
//  MailManager.swift
//  woddr
//
//  Created by Tofik Mamishov on 04/01/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//
import MessageUI

class MailManager {
    private static let addresses = ["mamishov.tofik@gmail.com"]

    private weak var mailComposeViewControllerDelegate: MFMailComposeViewControllerDelegate!

    init(delegate: MFMailComposeViewControllerDelegate) {
        self.mailComposeViewControllerDelegate = delegate
    }

    func mailComposeViewController(subject: String) -> UIViewController {
        guard MFMailComposeViewController.canSendMail() else {
            return errorAlertController(message: "Apple's Mail app is not available on your device.")
        }
        let mailComposeVewController = MFMailComposeViewController()
        mailComposeVewController.mailComposeDelegate = self.mailComposeViewControllerDelegate
        mailComposeVewController.setToRecipients(MailManager.addresses)
        mailComposeVewController.setSubject(subject)
        return mailComposeVewController
    }

    private func errorAlertController(message: String) -> UIViewController {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alertController
    }
}
