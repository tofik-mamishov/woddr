//
//  DetailsViewController.swift
//  woddr
//
//  Created by Tofik Mamishov on 31/01/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate,
    UITableViewDataSource, DetailsViewProtocol {

    @IBOutlet weak var rollResultsTableView: UITableView!

    var presenter: DetailsPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.rollResultsTableView.delegate = self
        self.rollResultsTableView.dataSource = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.presenter.rollResults.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.presenter.titleForHeader(in: section)
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let sectionHeaderView = view as? UITableViewHeaderFooterView {
            self.presenter.setup(headerView: sectionHeaderView)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.rollResults[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RollResultCell") else {
            fatalError("No reusable cell with identifier: RollResultCell")
        }
        return self.presenter.setup(cell: cell, at: indexPath)
    }
}
