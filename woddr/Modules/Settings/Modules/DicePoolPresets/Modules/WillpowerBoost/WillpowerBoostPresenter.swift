//
//  WillpowerBoostPresenter.swift
//  woddr
//
//  Created by Tofik Mamishov on 17/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//
import UIKit

class WillpowerBoostPresenter: WillpowerBoostPresenterProtocol {
    private let tableManager = WillpowerBoostTableManager()

    private var view: WillpowerBoostViewProtocol!
    private var interactor: WillpowerBoostInteractorProtocol!

    init(view: WillpowerBoostViewProtocol,
         interactor: WillpowerBoostInteractorProtocol) {
        self.view = view
        self.view.tableView.delegate = self.tableManager
        self.view.tableView.dataSource = self.tableManager
        self.interactor = interactor
        self.tableManager.didSelectRowHandler = { boost in
            self.interactor.willpowerBoost = boost
        }
    }

    func loadSelectedWillpowerBoost() {
        let row = WillpowerBoostType.allCases.firstIndex(of: self.interactor.willpowerBoost) ?? 0
        self.view.tableView.selectRow(at: IndexPath(row: row, section: 0),
                                      animated: true,
                                      scrollPosition: .none)
    }
}
