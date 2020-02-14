//
//  CritRulePresenter.swift
//  woddr
//
//  Created by Tofik Mamishov on 02/02/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class CritRulePresenter: CritRulePresenterProtocol {
    private weak var view: CritRuleViewProtocol!
    private var interactor: CritRuleInteractorProtocol!
    private var selectedRowIndexPath: IndexPath?

    init(view: CritRuleViewProtocol, interactor: CritRuleInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }

    func critRule() -> CritRuleType {
        return self.interactor.critRulePreset()
    }

    func numberOfRowsInSection() -> Int {
        return CritRuleType.allCases.count
    }

    func cell(for row: Int) -> UITableViewCell {
        guard let cell = self.view.tableView().dequeueReusableCell(withIdentifier: "critRuleCell")
            as? CritRuleCell else {
                fatalError("No reusable cell with identifier: CritRuleCell")
        }
        cell.rule = CritRuleType.allCases[row]
        return cell
    }

    func selectCritRule(at indexPath: IndexPath) {
        self.selectedRowIndexPath = indexPath
        let critRule = CritRuleType.allCases[indexPath.row]
        self.interactor.saveCritRulePreset(value: critRule)
    }

    func willDisplay(cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let critRuleCell = cell as? CritRuleCell
        guard let rule = critRuleCell?.rule else {
            return
        }
        let selected = self.interactor.critRulePreset() == rule
        if selected {
            self.selectedRowIndexPath = indexPath
            self.selectRow(at: indexPath)
        }
    }

    func viewWillAppear() {
        self.restoreSelectedRow()
    }

    private func restoreSelectedRow() {
        guard let indexPath = self.selectedRowIndexPath else {
            return
        }
        self.selectRow(at: indexPath)
    }

    private func selectRow(at indexPath: IndexPath) {
        self.view.tableView().selectRow(at: indexPath, animated: true,
                                        scrollPosition: .none)
    }
}
