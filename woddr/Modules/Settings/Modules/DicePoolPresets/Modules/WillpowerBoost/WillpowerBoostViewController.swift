//
//  WillpowerBoostViewController.swift
//  woddr
//
//  Created by Tofik Mamishov on 17/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class WillpowerBoostViewController: UITableViewController, WillpowerBoostViewProtocol {
    var presenter: WillpowerBoostPresenterProtocol!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.loadSelectedWillpowerBoost()
    }
}
