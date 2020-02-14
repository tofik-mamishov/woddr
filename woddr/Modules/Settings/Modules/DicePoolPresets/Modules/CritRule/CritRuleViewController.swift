//
//  CritRuleViewController.swift
//  woddr
//
//  Created by Tofik Mamishov on 03/02/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class CritRuleViewController: UITableViewController, CritRuleViewProtocol {
    var presenter: CritRulePresenterProtocol!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear()
    }

    func tableView() -> UITableView {
        return self.tableView
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOfRowsInSection()
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.presenter.cell(for: indexPath.row)
    }

    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        self.presenter.selectCritRule(at: indexPath)
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell,
                            forRowAt indexPath: IndexPath) {
        self.presenter.willDisplay(cell: cell, forRowAt: indexPath)
    }
}
