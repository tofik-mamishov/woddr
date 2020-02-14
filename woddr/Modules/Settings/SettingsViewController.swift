//
//  SettingsViewController.swift
//  woddr
//
//  Created by Tofik Mamishov on 25/03/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

import UIKit
import MessageUI

class SettingsViewController: UITableViewController, SettingsViewProtocol {
    var presenter: SettingsPresenterProtocol!

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellId = tableView.cellForRow(at: indexPath)?.reuseIdentifier else {
            return
        }
        switch cellId {
        case "feedbackCell":
            self.presenter.displayCompositionInterface(subject: "woddr - Feedback")
        case "reportBugCell":
            self.presenter.displayCompositionInterface(subject: "woddr - Bug")
        default:
            return
        }
    }

    func present(_ viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
}
