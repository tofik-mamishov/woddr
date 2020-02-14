//
//  MailComposeViewControllerDelegate.swift
//  woddr
//
//  Created by Tofik Mamishov on 02/01/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit
import MessageUI

class MailComposeViewControllerDelegate: NSObject, MFMailComposeViewControllerDelegate {

    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
